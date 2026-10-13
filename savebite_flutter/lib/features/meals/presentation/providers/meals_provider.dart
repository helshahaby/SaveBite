import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savebite_client/savebite_client.dart';
import '../../../../client.dart';
import '../../../pantry/presentation/providers/pantry_provider.dart';

final mealSuggestionsProvider = FutureProvider<List<MealSuggestion>>((ref) async {
  final pantryState = ref.watch(pantryProvider);
  final activeItems = pantryState.activeItems;

  if (!pantryState.isDemoMode && client.auth.isAuthenticated) {
    try {
      return await client.pantry.getMealSuggestions();
    } catch (_) {
      // Fallback to client-side matching if server call has temporary issue
    }
  }

  // Client-side fallback matching
  return _generateClientSuggestions(activeItems);
});

List<MealSuggestion> _generateClientSuggestions(List<PantryItem> activeItems) {
  final availableNames =
      activeItems.map((e) => e.name.toLowerCase().trim()).toList();

  final templates = [
    {
      'id': 'veggie_stir_fry',
      'title': 'Pantry Harvest Stir-Fry',
      'desc': 'High-heat sauté utilizing vegetables, greens, and grains.',
      'prep': 20,
      'diff': 'Easy',
      'cat': 'Dinner',
      'ings': ['spinach', 'broccoli', 'carrot', 'onion', 'garlic', 'chicken', 'rice'],
      'steps': [
        'Chop crisp vegetables into uniform bite-sized pieces.',
        'Sauté firmer produce in a splash of hot oil for 3-4 minutes.',
        'Add tender greens and pre-cooked grains; stir well.',
        'Season with soy sauce, pepper, or herbs, and serve hot.',
      ],
    },
    {
      'id': 'rescue_frittata',
      'title': 'Golden Skillet Frittata',
      'desc': 'Whisked egg bake that turns expiring dairy and veggies into a feast.',
      'prep': 25,
      'diff': 'Easy',
      'cat': 'Breakfast / Lunch',
      'ings': ['egg', 'yogurt', 'milk', 'cheese', 'spinach', 'sourdough', 'tomato'],
      'steps': [
        'Whisk eggs with a splash of milk or yogurt.',
        'Sauté leftover veggies in an oven-safe skillet until tender.',
        'Pour eggs over vegetables and cook on low heat until set.',
        'Broil for 3 minutes for a golden, puffy top crust.',
      ],
    },
    {
      'id': 'fruit_smoothie_bowl',
      'title': 'Ripe Fruit Rescue Smoothie',
      'desc': 'Blended bowl rescuing bananas, berries, and opened dairy.',
      'prep': 10,
      'diff': 'Easy',
      'cat': 'Breakfast',
      'ings': ['banana', 'strawberry', 'berries', 'yogurt', 'milk', 'spinach', 'oats'],
      'steps': [
        'Peel and slice ripe fruits.',
        'Blend with yogurt or milk until thick and creamy.',
        'Top with nuts, toasted bread cubes, or seeds.',
      ],
    },
    {
      'id': 'french_toast_bake',
      'title': 'Sourdough French Toast Delight',
      'desc': 'Revives day-old bread with sweet egg wash and warm spices.',
      'prep': 15,
      'diff': 'Easy',
      'cat': 'Breakfast',
      'ings': ['sourdough', 'bread', 'egg', 'milk', 'banana', 'cinnamon'],
      'steps': [
        'Whisk eggs, milk, and a pinch of cinnamon.',
        'Dip bread slices until soaked.',
        'Pan-fry in butter until crisp and golden brown on both sides.',
      ],
    },
  ];

  final list = <MealSuggestion>[];

  for (final t in templates) {
    final ings = t['ings'] as List<String>;
    final used = <String>[];
    final missing = <String>[];

    for (final ing in ings) {
      if (availableNames.any((n) => n.contains(ing) || ing.contains(n))) {
        used.add(ing);
      } else {
        missing.add(ing);
      }
    }

    final score = ings.isEmpty ? 0.0 : (used.length / ings.length);

    list.add(
      MealSuggestion(
        id: t['id'] as String,
        title: t['title'] as String,
        description: t['desc'] as String,
        prepTimeMinutes: t['prep'] as int,
        difficulty: t['diff'] as String,
        category: t['cat'] as String,
        ingredientsUsed: used,
        missingIngredients: missing,
        matchScore: score,
        instructions: (t['steps'] as List<String>),
      ),
    );
  }

  list.sort((a, b) => b.matchScore.compareTo(a.matchScore));
  return list;
}
