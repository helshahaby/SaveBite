import 'package:flutter/material.dart';
import 'package:savebite_client/savebite_client.dart';
import '../theme/app_theme.dart';

enum ExpiryUrgency {
  expired,
  today,
  soon,
  fresh,
}

class UrgencyHelper {
  static int getDaysUntilExpiry(DateTime expiry) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(expiry.year, expiry.month, expiry.day);
    return target.difference(today).inDays;
  }

  static ExpiryUrgency getUrgency(DateTime expiry) {
    final days = getDaysUntilExpiry(expiry);
    if (days < 0) return ExpiryUrgency.expired;
    if (days == 0) return ExpiryUrgency.today;
    if (days <= 3) return ExpiryUrgency.soon;
    return ExpiryUrgency.fresh;
  }

  static String getUrgencyLabel(DateTime expiry) {
    final days = getDaysUntilExpiry(expiry);
    if (days < 0) return 'Expired (${days.abs()}d ago)';
    if (days == 0) return 'Expires Today!';
    if (days == 1) return 'Expires Tomorrow';
    if (days <= 3) return 'Expires in $days days';
    if (days <= 7) return 'Expires in $days days';
    return '$days days left';
  }

  static Color getUrgencyColor(DateTime expiry) {
    switch (getUrgency(expiry)) {
      case ExpiryUrgency.expired:
        return AppTheme.alertRed;
      case ExpiryUrgency.today:
      case ExpiryUrgency.soon:
        return AppTheme.accentAmber;
      case ExpiryUrgency.fresh:
        return AppTheme.freshEmerald;
    }
  }

  static Color getUrgencyBackgroundColor(DateTime expiry) {
    switch (getUrgency(expiry)) {
      case ExpiryUrgency.expired:
        return AppTheme.alertRedLight;
      case ExpiryUrgency.today:
      case ExpiryUrgency.soon:
        return AppTheme.accentAmberLight;
      case ExpiryUrgency.fresh:
        return AppTheme.freshEmeraldLight;
    }
  }

  static IconData getCategoryIcon(FoodCategory category) {
    switch (category) {
      case FoodCategory.produce:
        return Icons.eco_outlined;
      case FoodCategory.dairy:
        return Icons.egg_outlined;
      case FoodCategory.bakery:
        return Icons.bakery_dining_outlined;
      case FoodCategory.meat:
        return Icons.set_meal_outlined;
      case FoodCategory.pantry:
        return Icons.inventory_2_outlined;
      case FoodCategory.meals:
        return Icons.dinner_dining_outlined;
      case FoodCategory.drinks:
        return Icons.local_cafe_outlined;
      case FoodCategory.other:
        return Icons.category_outlined;
    }
  }

  static String getCategoryName(FoodCategory category) {
    switch (category) {
      case FoodCategory.produce:
        return 'Produce';
      case FoodCategory.dairy:
        return 'Dairy & Eggs';
      case FoodCategory.bakery:
        return 'Bakery';
      case FoodCategory.meat:
        return 'Meat & Seafood';
      case FoodCategory.pantry:
        return 'Pantry Dry';
      case FoodCategory.meals:
        return 'Prepared Meals';
      case FoodCategory.drinks:
        return 'Beverages';
      case FoodCategory.other:
        return 'Other';
    }
  }

  static IconData getStorageIcon(StorageType storage) {
    switch (storage) {
      case StorageType.fridge:
        return Icons.kitchen_outlined;
      case StorageType.freezer:
        return Icons.ac_unit_outlined;
      case StorageType.pantry:
        return Icons.shelves;
    }
  }

  static String getStorageName(StorageType storage) {
    switch (storage) {
      case StorageType.fridge:
        return 'Fridge';
      case StorageType.freezer:
        return 'Freezer';
      case StorageType.pantry:
        return 'Pantry';
    }
  }
}
