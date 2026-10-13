import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';
import '../util/auth_helpers.dart';
import 'meal_suggestion_engine.dart';

/// Endpoint managing household pantry items, expiration tracking, dashboard metrics,
/// and smart recipe recommendations.
class PantryEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  /// Retrieves pantry items belonging to the authenticated user, optionally filtered.
  Future<List<PantryItem>> getPantryItems(
    Session session, {
    ItemStatus? statusFilter,
    StorageType? storageFilter,
    FoodCategory? categoryFilter,
  }) async {
    final authUserId = session.requiredAuthUserId;

    return await PantryItem.db.find(
      session,
      where: (t) {
        var query = t.userId.equals(authUserId);
        if (statusFilter != null) {
          query = query & t.status.equals(statusFilter);
        }
        if (storageFilter != null) {
          query = query & t.storageType.equals(storageFilter);
        }
        if (categoryFilter != null) {
          query = query & t.category.equals(categoryFilter);
        }
        return query;
      },
      orderBy: (t) => t.expirationDate,
    );
  }

  /// Adds a new pantry item for the authenticated user with validation.
  Future<PantryItem> addPantryItem(
    Session session, {
    required String name,
    required FoodCategory category,
    required double quantity,
    required String unit,
    required StorageType storageType,
    required DateTime expirationDate,
    double? cost,
    String? notes,
  }) async {
    final authUserId = session.requiredAuthUserId;
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw FormatException('Item name cannot be empty.');
    }
    if (quantity <= 0) {
      throw FormatException('Quantity must be greater than zero.');
    }

    final now = DateTime.now();
    final item = PantryItem(
      userId: authUserId,
      name: trimmedName,
      category: category,
      quantity: quantity,
      unit: unit.trim().isEmpty ? 'pcs' : unit.trim(),
      storageType: storageType,
      purchaseDate: now,
      expirationDate: expirationDate,
      cost: cost != null && cost >= 0 ? cost : null,
      notes: notes?.trim().isEmpty == true ? null : notes?.trim(),
      status: ItemStatus.active,
      createdAt: now,
      updatedAt: now,
    );

    return await PantryItem.db.insertRow(session, item);
  }

  /// Updates an existing pantry item after verifying ownership.
  Future<PantryItem> updatePantryItem(
    Session session, {
    required int itemId,
    required String name,
    required FoodCategory category,
    required double quantity,
    required String unit,
    required StorageType storageType,
    required DateTime expirationDate,
    double? cost,
    String? notes,
  }) async {
    final authUserId = session.requiredAuthUserId;
    final item = await PantryItem.db.findById(session, itemId);
    if (item == null) {
      throw FormatException('Pantry item not found.');
    }
    if (item.userId != authUserId) {
      throw FormatException('Forbidden: You do not own this pantry item.');
    }

    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw FormatException('Item name cannot be empty.');
    }
    if (quantity <= 0) {
      throw FormatException('Quantity must be greater than zero.');
    }

    item.name = trimmedName;
    item.category = category;
    item.quantity = quantity;
    item.unit = unit.trim().isEmpty ? 'pcs' : unit.trim();
    item.storageType = storageType;
    item.expirationDate = expirationDate;
    item.cost = cost != null && cost >= 0 ? cost : item.cost;
    item.notes = notes?.trim().isEmpty == true ? null : notes?.trim();
    item.updatedAt = DateTime.now();

    return await PantryItem.db.updateRow(session, item);
  }

  /// Marks a pantry item as consumed, saving it from waste.
  Future<PantryItem> markConsumed(
    Session session, {
    required int itemId,
  }) async {
    final authUserId = session.requiredAuthUserId;
    final item = await PantryItem.db.findById(session, itemId);
    if (item == null) {
      throw FormatException('Pantry item not found.');
    }
    if (item.userId != authUserId) {
      throw FormatException('Forbidden: You do not own this pantry item.');
    }

    final now = DateTime.now();
    item.status = ItemStatus.consumed;
    item.consumedAt = now;
    item.updatedAt = now;
    return await PantryItem.db.updateRow(session, item);
  }

  /// Marks a pantry item as wasted.
  Future<PantryItem> markWasted(
    Session session, {
    required int itemId,
  }) async {
    final authUserId = session.requiredAuthUserId;
    final item = await PantryItem.db.findById(session, itemId);
    if (item == null) {
      throw FormatException('Pantry item not found.');
    }
    if (item.userId != authUserId) {
      throw FormatException('Forbidden: You do not own this pantry item.');
    }

    final now = DateTime.now();
    item.status = ItemStatus.wasted;
    item.wastedAt = now;
    item.updatedAt = now;
    return await PantryItem.db.updateRow(session, item);
  }

  /// Deletes a pantry item after verifying ownership.
  Future<bool> deletePantryItem(
    Session session, {
    required int itemId,
  }) async {
    final authUserId = session.requiredAuthUserId;
    final item = await PantryItem.db.findById(session, itemId);
    if (item == null) {
      return false;
    }
    if (item.userId != authUserId) {
      throw FormatException('Forbidden: You do not own this pantry item.');
    }

    await PantryItem.db.deleteRow(session, item);
    return true;
  }

  /// Calculates aggregated dashboard metrics, savings, and urgent items for the user.
  Future<DashboardSummary> getDashboardSummary(Session session) async {
    final authUserId = session.requiredAuthUserId;
    final allItems = await PantryItem.db.find(
      session,
      where: (t) => t.userId.equals(authUserId),
      orderBy: (t) => t.expirationDate,
    );

    final now = DateTime.now();
    final urgentThreshold = now.add(const Duration(days: 3));

    int activeCount = 0;
    int expiringSoonCount = 0;
    int expiredCount = 0;
    int consumedCount = 0;
    int wastedCount = 0;
    double moneySaved = 0.0;
    double moneyWasted = 0.0;

    final useFirstList = <PantryItem>[];

    const defaultEstimatedItemCost = 3.50; // $3.50 average grocery item assumption

    for (final item in allItems) {
      switch (item.status) {
        case ItemStatus.active:
          activeCount++;
          if (item.expirationDate.isBefore(now)) {
            expiredCount++;
          } else if (item.expirationDate.isBefore(urgentThreshold)) {
            expiringSoonCount++;
          }
          if (useFirstList.length < 5) {
            useFirstList.add(item);
          }
          break;
        case ItemStatus.consumed:
          consumedCount++;
          moneySaved += (item.cost ?? defaultEstimatedItemCost);
          break;
        case ItemStatus.wasted:
          wastedCount++;
          moneyWasted += (item.cost ?? defaultEstimatedItemCost);
          break;
      }
    }

    // Environmental impact: ~2.5 kg CO2e prevented per item/kg saved from waste
    final co2AvoidedKg = consumedCount * 2.5;

    return DashboardSummary(
      totalItemsTracked: activeCount,
      itemsExpiringSoon: expiringSoonCount,
      itemsExpired: expiredCount,
      itemsConsumed: consumedCount,
      itemsWasted: wastedCount,
      estimatedMoneySaved: moneySaved,
      estimatedMoneyWasted: moneyWasted,
      co2AvoidedKg: co2AvoidedKg,
      useFirstItems: useFirstList,
    );
  }

  /// Returns meal suggestions matching active pantry items, prioritizing expiring food.
  Future<List<MealSuggestion>> getMealSuggestions(Session session) async {
    final authUserId = session.requiredAuthUserId;
    final activeItems = await PantryItem.db.find(
      session,
      where: (t) => t.userId.equals(authUserId) & t.status.equals(ItemStatus.active),
      orderBy: (t) => t.expirationDate,
    );

    return MealSuggestionEngine.generateSuggestions(activeItems);
  }
}
