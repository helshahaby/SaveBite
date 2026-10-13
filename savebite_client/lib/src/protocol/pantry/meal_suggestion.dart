/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:savebite_client/src/protocol/protocol.dart' as _i5gxi1ji;
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class MealSuggestion
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  MealSuggestion._({
    required this.id,
    required this.title,
    required this.description,
    required this.prepTimeMinutes,
    required this.difficulty,
    required this.ingredientsUsed,
    required this.missingIngredients,
    required this.matchScore,
    required this.instructions,
    required this.category,
  });

  factory MealSuggestion({
    required String id,
    required String title,
    required String description,
    required int prepTimeMinutes,
    required String difficulty,
    required List<String> ingredientsUsed,
    required List<String> missingIngredients,
    required double matchScore,
    required List<String> instructions,
    required String category,
  }) = _MealSuggestionImpl;

  factory MealSuggestion.fromJson(Map<String, dynamic> jsonSerialization) {
    return MealSuggestion(
      id: jsonSerialization['id'] as String,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      prepTimeMinutes: jsonSerialization['prepTimeMinutes'] as int,
      difficulty: jsonSerialization['difficulty'] as String,
      ingredientsUsed: _i5gxi1ji.Protocol().deserialize<List<String>>(
        jsonSerialization['ingredientsUsed'],
      ),
      missingIngredients: _i5gxi1ji.Protocol().deserialize<List<String>>(
        jsonSerialization['missingIngredients'],
      ),
      matchScore: (jsonSerialization['matchScore'] as num).toDouble(),
      instructions: _i5gxi1ji.Protocol().deserialize<List<String>>(
        jsonSerialization['instructions'],
      ),
      category: jsonSerialization['category'] as String,
    );
  }

  String id;

  String title;

  String description;

  int prepTimeMinutes;

  String difficulty;

  List<String> ingredientsUsed;

  List<String> missingIngredients;

  double matchScore;

  List<String> instructions;

  String category;

  /// Returns a shallow copy of this [MealSuggestion]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  MealSuggestion copyWith({
    String? id,
    String? title,
    String? description,
    int? prepTimeMinutes,
    String? difficulty,
    List<String>? ingredientsUsed,
    List<String>? missingIngredients,
    double? matchScore,
    List<String>? instructions,
    String? category,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MealSuggestion',
      'id': id,
      'title': title,
      'description': description,
      'prepTimeMinutes': prepTimeMinutes,
      'difficulty': difficulty,
      'ingredientsUsed': ingredientsUsed.toJson(),
      'missingIngredients': missingIngredients.toJson(),
      'matchScore': matchScore,
      'instructions': instructions.toJson(),
      'category': category,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MealSuggestion',
      'id': id,
      'title': title,
      'description': description,
      'prepTimeMinutes': prepTimeMinutes,
      'difficulty': difficulty,
      'ingredientsUsed': ingredientsUsed.toJson(),
      'missingIngredients': missingIngredients.toJson(),
      'matchScore': matchScore,
      'instructions': instructions.toJson(),
      'category': category,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _MealSuggestionImpl extends MealSuggestion {
  _MealSuggestionImpl({
    required String id,
    required String title,
    required String description,
    required int prepTimeMinutes,
    required String difficulty,
    required List<String> ingredientsUsed,
    required List<String> missingIngredients,
    required double matchScore,
    required List<String> instructions,
    required String category,
  }) : super._(
         id: id,
         title: title,
         description: description,
         prepTimeMinutes: prepTimeMinutes,
         difficulty: difficulty,
         ingredientsUsed: ingredientsUsed,
         missingIngredients: missingIngredients,
         matchScore: matchScore,
         instructions: instructions,
         category: category,
       );

  /// Returns a shallow copy of this [MealSuggestion]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  MealSuggestion copyWith({
    String? id,
    String? title,
    String? description,
    int? prepTimeMinutes,
    String? difficulty,
    List<String>? ingredientsUsed,
    List<String>? missingIngredients,
    double? matchScore,
    List<String>? instructions,
    String? category,
  }) {
    return MealSuggestion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
      difficulty: difficulty ?? this.difficulty,
      ingredientsUsed:
          ingredientsUsed ?? this.ingredientsUsed.map((e0) => e0).toList(),
      missingIngredients:
          missingIngredients ??
          this.missingIngredients.map((e0) => e0).toList(),
      matchScore: matchScore ?? this.matchScore,
      instructions: instructions ?? this.instructions.map((e0) => e0).toList(),
      category: category ?? this.category,
    );
  }
}
