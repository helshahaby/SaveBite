import '../generated/protocol.dart';

/// Deterministic recipe engine matching active pantry items with flexible recipes.
class MealSuggestionEngine {
  static const List<_RecipeTemplate> _templates = [
    _RecipeTemplate(
      id: 'quick_veggie_stir_fry',
      title: 'Pantry Vegetable Stir-Fry',
      description:
          'A quick, high-heat stir fry that uses up crisp produce, greens, and pantry staples in minutes.',
      prepTimeMinutes: 20,
      difficulty: 'Easy',
      category: 'Dinner',
      keyIngredients: [
        'broccoli',
        'carrot',
        'bell pepper',
        'onion',
        'garlic',
        'rice',
        'tofu',
        'chicken',
        'mushroom',
        'spinach',
        'soy sauce',
      ],
      instructions: [
        'Chop all available vegetables into bite-sized pieces.',
        'Heat 1 tbsp oil in a skillet or wok over medium-high heat.',
        'Sauté garlic and firmer vegetables (carrots, broccoli) for 3-4 minutes.',
        'Toss in quick-cooking greens, sauce, and pre-cooked rice or noodles.',
        'Stir vigorously for 2 minutes and serve steaming hot.',
      ],
    ),
    _RecipeTemplate(
      id: 'harvest_frittata',
      title: 'Harvest Kitchen Frittata',
      description:
          'Transform expiring eggs, dairy, herbs, and leftover cooked veggies into a satisfying bake.',
      prepTimeMinutes: 25,
      difficulty: 'Easy',
      category: 'Breakfast / Lunch',
      keyIngredients: [
        'egg',
        'milk',
        'cheese',
        'spinach',
        'onion',
        'tomato',
        'potato',
        'pepper',
        'mushroom',
      ],
      instructions: [
        'Whisk eggs with a splash of milk, salt, and pepper in a bowl.',
        'Sauté vegetables and aromatics in an oven-safe skillet until softened.',
        'Pour egg mixture over the vegetables and sprinkle cheese on top.',
        'Cook on low until edges set, then broil for 3-5 minutes until golden.',
      ],
    ),
    _RecipeTemplate(
      id: 'zero_waste_smoothie',
      title: 'Rescue Fruit Smoothie Bowl',
      description:
          'Perfect for ripe bananas, softening berries, and opened yogurt or milk.',
      prepTimeMinutes: 10,
      difficulty: 'Easy',
      category: 'Breakfast',
      keyIngredients: [
        'banana',
        'berry',
        'strawberry',
        'blueberry',
        'apple',
        'yogurt',
        'milk',
        'spinach',
        'oats',
        'honey',
      ],
      instructions: [
        'Slice and peel ripe fruits.',
        'Add fruits, yogurt/milk, and a handful of oats into a blender.',
        'Blend on high until smooth and creamy.',
        'Pour into a bowl and garnish with nuts or seeds.',
      ],
    ),
    _RecipeTemplate(
      id: 'hearty_minestrone',
      title: 'Hearty Pantry Minestrone',
      description:
          'A comforting Italian soup built to rescue root vegetables, beans, and leftover pasta.',
      prepTimeMinutes: 35,
      difficulty: 'Medium',
      category: 'Dinner',
      keyIngredients: [
        'tomato',
        'beans',
        'carrot',
        'celery',
        'onion',
        'garlic',
        'pasta',
        'zucchini',
        'broth',
        'spinach',
      ],
      instructions: [
        'Sauté diced onions, carrots, and celery in olive oil until aromatic.',
        'Add garlic, chopped tomatoes, and vegetable or chicken broth.',
        'Simmer for 15 minutes, then add beans and pasta.',
        'Cook until pasta is al dente, stir in tender greens, and season.',
      ],
    ),
    _RecipeTemplate(
      id: 'golden_fried_rice',
      title: 'Golden Leftover Fried Rice',
      description:
          'The ultimate solution for day-old rice, stray eggs, and mixed vegetables.',
      prepTimeMinutes: 15,
      difficulty: 'Easy',
      category: 'Lunch / Dinner',
      keyIngredients: [
        'rice',
        'egg',
        'peas',
        'carrot',
        'onion',
        'garlic',
        'soy sauce',
        'sesame oil',
        'green onion',
      ],
      instructions: [
        'Scramble eggs in a hot wok and set aside.',
        'Sauté diced aromatics and vegetables until lightly tender.',
        'Add cold cooked rice, breaking up clumps with a spatula.',
        'Drizzle soy sauce, fold scrambled eggs back in, and toss to combine.',
      ],
    ),
  ];

  static List<MealSuggestion> generateSuggestions(List<PantryItem> activeItems) {
    final availableNames = activeItems
        .map((e) => e.name.toLowerCase().trim())
        .toList();

    final suggestions = <MealSuggestion>[];

    for (final template in _templates) {
      final used = <String>[];
      final missing = <String>[];

      for (final ing in template.keyIngredients) {
        final matches = availableNames.any(
          (name) => name.contains(ing) || ing.contains(name),
        );
        if (matches) {
          used.add(ing);
        } else {
          missing.add(ing);
        }
      }

      final score = template.keyIngredients.isEmpty
          ? 0.0
          : (used.length / template.keyIngredients.length);

      suggestions.add(
        MealSuggestion(
          id: template.id,
          title: template.title,
          description: template.description,
          prepTimeMinutes: template.prepTimeMinutes,
          difficulty: template.difficulty,
          category: template.category,
          ingredientsUsed: used,
          missingIngredients: missing,
          matchScore: score,
          instructions: template.instructions,
        ),
      );
    }

    // Sort by match score descending so recipes using available items rank highest
    suggestions.sort((a, b) => b.matchScore.compareTo(a.matchScore));
    return suggestions;
  }
}

class _RecipeTemplate {
  final String id;
  final String title;
  final String description;
  final int prepTimeMinutes;
  final String difficulty;
  final String category;
  final List<String> keyIngredients;
  final List<String> instructions;

  const _RecipeTemplate({
    required this.id,
    required this.title,
    required this.description,
    required this.prepTimeMinutes,
    required this.difficulty,
    required this.category,
    required this.keyIngredients,
    required this.instructions,
  });
}
