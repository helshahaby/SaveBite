import 'package:savebite_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_test/serverpod_test.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given PantryEndpoint', (sessionBuilder, endpoints) {
    final userAId = const Uuid().v4();
    final userBId = const Uuid().v4();

    final userASession = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(userAId, {}),
    );

    final userBSession = sessionBuilder.copyWith(
      authentication: AuthenticationOverride.authenticationInfo(userBId, {}),
    );

    test('when adding a valid pantry item then item is persisted with active status', () async {
      final now = DateTime.now();
      final expiry = now.add(const Duration(days: 5));

      final item = await endpoints.pantry.addPantryItem(
        userASession,
        name: 'Fresh Spinach',
        category: FoodCategory.produce,
        quantity: 2.0,
        unit: 'bags',
        storageType: StorageType.fridge,
        expirationDate: expiry,
        cost: 3.99,
        notes: 'Organic baby spinach',
      );

      expect(item.id, isNotNull);
      expect(item.name, 'Fresh Spinach');
      expect(item.category, FoodCategory.produce);
      expect(item.status, ItemStatus.active);
      expect(item.cost, 3.99);

      final items = await endpoints.pantry.getPantryItems(userASession);
      expect(items.any((i) => i.id == item.id), isTrue);
    });

    test('when adding item with empty name then FormatException is thrown', () async {
      expect(
        () async => await endpoints.pantry.addPantryItem(
          userASession,
          name: '   ',
          category: FoodCategory.produce,
          quantity: 1.0,
          unit: 'pcs',
          storageType: StorageType.fridge,
          expirationDate: DateTime.now().add(const Duration(days: 2)),
        ),
        throwsA(isA<FormatException>()),
      );
    });

    test('when user B attempts to modify user A item then FormatException forbidden is thrown', () async {
      final item = await endpoints.pantry.addPantryItem(
        userASession,
        name: 'Whole Milk',
        category: FoodCategory.dairy,
        quantity: 1.0,
        unit: 'gal',
        storageType: StorageType.fridge,
        expirationDate: DateTime.now().add(const Duration(days: 4)),
        cost: 4.50,
      );

      expect(
        () async => await endpoints.pantry.markConsumed(
          userBSession,
          itemId: item.id!,
        ),
        throwsA(isA<FormatException>()),
      );
    });

    test('when marking item consumed then status transitions and dashboard records savings', () async {
      final item = await endpoints.pantry.addPantryItem(
        userASession,
        name: 'Ripe Bananas',
        category: FoodCategory.produce,
        quantity: 5.0,
        unit: 'pcs',
        storageType: StorageType.pantry,
        expirationDate: DateTime.now().add(const Duration(days: 1)),
        cost: 2.50,
      );

      final updated = await endpoints.pantry.markConsumed(
        userASession,
        itemId: item.id!,
      );

      expect(updated.status, ItemStatus.consumed);
      expect(updated.consumedAt, isNotNull);

      final summary = await endpoints.pantry.getDashboardSummary(userASession);
      expect(summary.itemsConsumed, greaterThanOrEqualTo(1));
      expect(summary.estimatedMoneySaved, greaterThanOrEqualTo(2.50));
      expect(summary.co2AvoidedKg, greaterThanOrEqualTo(2.5));
    });

    test('when requesting meal suggestions with available ingredients then recipes are ranked', () async {
      await endpoints.pantry.addPantryItem(
        userASession,
        name: 'Broccoli',
        category: FoodCategory.produce,
        quantity: 1.0,
        unit: 'head',
        storageType: StorageType.fridge,
        expirationDate: DateTime.now().add(const Duration(days: 2)),
      );

      await endpoints.pantry.addPantryItem(
        userASession,
        name: 'Carrots',
        category: FoodCategory.produce,
        quantity: 3.0,
        unit: 'pcs',
        storageType: StorageType.fridge,
        expirationDate: DateTime.now().add(const Duration(days: 3)),
      );

      final suggestions = await endpoints.pantry.getMealSuggestions(userASession);
      expect(suggestions, isNotEmpty);
      expect(suggestions.first.ingredientsUsed, isNotEmpty);
      expect(suggestions.first.instructions, isNotEmpty);
    });
  });
}
