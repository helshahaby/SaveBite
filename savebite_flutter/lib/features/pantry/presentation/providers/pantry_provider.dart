import 'package:flutter_riverpod/legacy.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:savebite_client/savebite_client.dart';

import '../../../../client.dart';
import '../../../../core/utils/urgency_helper.dart';
import '../../data/sample_pantry_data.dart';

class PantryState {
  final List<PantryItem> items;
  final bool isLoading;
  final String? errorMessage;
  final bool isDemoMode;
  final String searchQuery;
  final StorageType? storageFilter;
  final FoodCategory? categoryFilter;
  final ExpiryUrgency? urgencyFilter;
  final String sortBy; // 'expiry', 'name', 'created'

  const PantryState({
    required this.items,
    this.isLoading = false,
    this.errorMessage,
    this.isDemoMode = true,
    this.searchQuery = '',
    this.storageFilter,
    this.categoryFilter,
    this.urgencyFilter,
    this.sortBy = 'expiry',
  });

  PantryState copyWith({
    List<PantryItem>? items,
    bool? isLoading,
    String? errorMessage,
    bool? isDemoMode,
    String? searchQuery,
    StorageType? storageFilter,
    bool clearStorageFilter = false,
    FoodCategory? categoryFilter,
    bool clearCategoryFilter = false,
    ExpiryUrgency? urgencyFilter,
    bool clearUrgencyFilter = false,
    String? sortBy,
  }) {
    return PantryState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isDemoMode: isDemoMode ?? this.isDemoMode,
      searchQuery: searchQuery ?? this.searchQuery,
      storageFilter: clearStorageFilter
          ? null
          : (storageFilter ?? this.storageFilter),
      categoryFilter: clearCategoryFilter
          ? null
          : (categoryFilter ?? this.categoryFilter),
      urgencyFilter: clearUrgencyFilter
          ? null
          : (urgencyFilter ?? this.urgencyFilter),
      sortBy: sortBy ?? this.sortBy,
    );
  }

  List<PantryItem> get activeItems =>
      items.where((i) => i.status == ItemStatus.active).toList();

  List<PantryItem> get consumedItems =>
      items.where((i) => i.status == ItemStatus.consumed).toList();

  List<PantryItem> get wastedItems =>
      items.where((i) => i.status == ItemStatus.wasted).toList();

  List<PantryItem> get expiringSoonItems {
    final active = activeItems;
    final now = DateTime.now();
    final urgentHorizon = now.add(const Duration(days: 3));
    return active
        .where((i) => i.expirationDate.isBefore(urgentHorizon))
        .toList()
      ..sort((a, b) => a.expirationDate.compareTo(b.expirationDate));
  }

  List<PantryItem> get filteredActiveItems {
    var result = activeItems;

    // Search query
    if (searchQuery.trim().isNotEmpty) {
      final q = searchQuery.toLowerCase().trim();
      result = result
          .where(
            (i) =>
                i.name.toLowerCase().contains(q) ||
                (i.notes?.toLowerCase().contains(q) ?? false),
          )
          .toList();
    }

    // Storage filter
    if (storageFilter != null) {
      result = result.where((i) => i.storageType == storageFilter).toList();
    }

    // Category filter
    if (categoryFilter != null) {
      result = result.where((i) => i.category == categoryFilter).toList();
    }

    // Urgency filter
    if (urgencyFilter != null) {
      result = result
          .where(
            (i) => UrgencyHelper.getUrgency(i.expirationDate) == urgencyFilter,
          )
          .toList();
    }

    // Sorting
    switch (sortBy) {
      case 'name':
        result.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
        break;
      case 'created':
        result.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      case 'expiry':
      default:
        result.sort((a, b) => a.expirationDate.compareTo(b.expirationDate));
        break;
    }

    return result;
  }

  double get estimatedMoneySaved {
    return consumedItems.fold(0.0, (sum, i) => sum + (i.cost ?? 3.50));
  }

  double get estimatedMoneyWasted {
    return wastedItems.fold(0.0, (sum, i) => sum + (i.cost ?? 3.50));
  }

  double get co2AvoidedKg => consumedItems.length * 2.5;
}

class PantryNotifier extends StateNotifier<PantryState> {
  PantryNotifier()
    : super(PantryState(items: SamplePantryData.getInitialSampleItems())) {
    loadItems();
    client.auth.authInfoListenable.addListener(_handleAuthChange);
  }

  void _handleAuthChange() {
    loadItems();
  }

  @override
  void dispose() {
    client.auth.authInfoListenable.removeListener(_handleAuthChange);
    super.dispose();
  }

  Future<void> loadItems() async {
    final isAuthenticated = client.auth.isAuthenticated;
    if (!isAuthenticated) {
      state = state.copyWith(
        items: SamplePantryData.getInitialSampleItems(),
        isDemoMode: true,
        isLoading: false,
      );
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final remoteItems = await client.pantry.getPantryItems();
      state = state.copyWith(
        items: remoteItems,
        isDemoMode: false,
        isLoading: false,
      );
    } catch (e) {
      debugPrint('Error loading pantry items from server: $e');
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Could not load server items. Using local cache.',
      );
    }
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void setStorageFilter(StorageType? type) {
    if (state.storageFilter == type) {
      state = state.copyWith(clearStorageFilter: true);
    } else {
      state = state.copyWith(storageFilter: type);
    }
  }

  void setCategoryFilter(FoodCategory? category) {
    if (state.categoryFilter == category) {
      state = state.copyWith(clearCategoryFilter: true);
    } else {
      state = state.copyWith(categoryFilter: category);
    }
  }

  void setUrgencyFilter(ExpiryUrgency? urgency) {
    if (state.urgencyFilter == urgency) {
      state = state.copyWith(clearUrgencyFilter: true);
    } else {
      state = state.copyWith(urgencyFilter: urgency);
    }
  }

  void setSortBy(String sort) {
    state = state.copyWith(sortBy: sort);
  }

  Future<bool> addItem({
    required String name,
    required FoodCategory category,
    required double quantity,
    required String unit,
    required StorageType storageType,
    required DateTime expirationDate,
    double? cost,
    String? notes,
  }) async {
    if (state.isDemoMode) {
      final now = DateTime.now();
      final newItem = PantryItem(
        id: DateTime.now().millisecondsSinceEpoch,
        userId: UuidValue.fromString('00000000-0000-0000-0000-000000000001'),
        name: name.trim(),
        category: category,
        quantity: quantity,
        unit: unit.trim().isEmpty ? 'pcs' : unit.trim(),
        storageType: storageType,
        purchaseDate: now,
        expirationDate: expirationDate,
        cost: cost,
        notes: notes?.trim().isEmpty == true ? null : notes?.trim(),
        status: ItemStatus.active,
        createdAt: now,
        updatedAt: now,
      );
      state = state.copyWith(items: [newItem, ...state.items]);
      return true;
    }

    try {
      final created = await client.pantry.addPantryItem(
        name: name,
        category: category,
        quantity: quantity,
        unit: unit,
        storageType: storageType,
        expirationDate: expirationDate,
        cost: cost,
        notes: notes,
      );
      state = state.copyWith(items: [created, ...state.items]);
      return true;
    } catch (e) {
      state = state.copyWith(errorMessage: 'Failed to add item: $e');
      return false;
    }
  }

  Future<bool> updateItem({
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
    if (state.isDemoMode) {
      final updatedList = state.items.map((item) {
        if (item.id == itemId) {
          return item.copyWith(
            name: name,
            category: category,
            quantity: quantity,
            unit: unit,
            storageType: storageType,
            expirationDate: expirationDate,
            cost: cost,
            notes: notes,
            updatedAt: DateTime.now(),
          );
        }
        return item;
      }).toList();
      state = state.copyWith(items: updatedList);
      return true;
    }

    try {
      final updated = await client.pantry.updatePantryItem(
        itemId: itemId,
        name: name,
        category: category,
        quantity: quantity,
        unit: unit,
        storageType: storageType,
        expirationDate: expirationDate,
        cost: cost,
        notes: notes,
      );
      final updatedList = state.items
          .map((i) => i.id == itemId ? updated : i)
          .toList();
      state = state.copyWith(items: updatedList);
      return true;
    } catch (e) {
      state = state.copyWith(errorMessage: 'Failed to update item: $e');
      return false;
    }
  }

  Future<void> markConsumed(int itemId) async {
    if (state.isDemoMode) {
      final now = DateTime.now();
      final updatedList = state.items.map((item) {
        if (item.id == itemId) {
          return item.copyWith(
            status: ItemStatus.consumed,
            consumedAt: now,
            updatedAt: now,
          );
        }
        return item;
      }).toList();
      state = state.copyWith(items: updatedList);
      return;
    }

    try {
      final updated = await client.pantry.markConsumed(itemId: itemId);
      final updatedList = state.items
          .map((i) => i.id == itemId ? updated : i)
          .toList();
      state = state.copyWith(items: updatedList);
    } catch (e) {
      state = state.copyWith(errorMessage: 'Failed to mark consumed: $e');
    }
  }

  Future<void> markWasted(int itemId) async {
    if (state.isDemoMode) {
      final now = DateTime.now();
      final updatedList = state.items.map((item) {
        if (item.id == itemId) {
          return item.copyWith(
            status: ItemStatus.wasted,
            wastedAt: now,
            updatedAt: now,
          );
        }
        return item;
      }).toList();
      state = state.copyWith(items: updatedList);
      return;
    }

    try {
      final updated = await client.pantry.markWasted(itemId: itemId);
      final updatedList = state.items
          .map((i) => i.id == itemId ? updated : i)
          .toList();
      state = state.copyWith(items: updatedList);
    } catch (e) {
      state = state.copyWith(errorMessage: 'Failed to mark wasted: $e');
    }
  }

  Future<void> deleteItem(int itemId) async {
    if (state.isDemoMode) {
      state = state.copyWith(
        items: state.items.where((i) => i.id != itemId).toList(),
      );
      return;
    }

    try {
      await client.pantry.deletePantryItem(itemId: itemId);
      state = state.copyWith(
        items: state.items.where((i) => i.id != itemId).toList(),
      );
    } catch (e) {
      state = state.copyWith(errorMessage: 'Failed to delete item: $e');
    }
  }
}

final pantryProvider = StateNotifierProvider<PantryNotifier, PantryState>((
  ref,
) {
  return PantryNotifier();
});
