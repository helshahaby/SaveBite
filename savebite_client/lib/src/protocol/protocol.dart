/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:savebite_client/src/protocol/pantry/meal_suggestion.dart'
    as _i70xmvmx;
import 'package:savebite_client/src/protocol/pantry/pantry_item.dart'
    as _i5k0mlmn;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'pantry/dashboard_summary.dart' as _is64iygo;
import 'pantry/food_category.dart' as _i792y5r1;
import 'pantry/item_status.dart' as _isa7q0n4;
import 'pantry/meal_suggestion.dart' as _i8uqnvll;
import 'pantry/pantry_item.dart' as _igjvgfoi;
import 'pantry/storage_type.dart' as _ik328j7n;
import 'users/user_profile.dart' as _if1uqcdu;
import 'users/user_role.dart' as _iyk67ys5;
export 'greetings/greeting.dart';
export 'pantry/dashboard_summary.dart';
export 'pantry/food_category.dart';
export 'pantry/item_status.dart';
export 'pantry/meal_suggestion.dart';
export 'pantry/pantry_item.dart';
export 'pantry/storage_type.dart';
export 'users/user_profile.dart';
export 'users/user_role.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _is64iygo.DashboardSummary) {
      return _is64iygo.DashboardSummary.fromJson(data) as T;
    }
    if (t == _i792y5r1.FoodCategory) {
      return _i792y5r1.FoodCategory.fromJson(data) as T;
    }
    if (t == _isa7q0n4.ItemStatus) {
      return _isa7q0n4.ItemStatus.fromJson(data) as T;
    }
    if (t == _i8uqnvll.MealSuggestion) {
      return _i8uqnvll.MealSuggestion.fromJson(data) as T;
    }
    if (t == _igjvgfoi.PantryItem) {
      return _igjvgfoi.PantryItem.fromJson(data) as T;
    }
    if (t == _ik328j7n.StorageType) {
      return _ik328j7n.StorageType.fromJson(data) as T;
    }
    if (t == _if1uqcdu.UserProfile) {
      return _if1uqcdu.UserProfile.fromJson(data) as T;
    }
    if (t == _iyk67ys5.UserRole) {
      return _iyk67ys5.UserRole.fromJson(data) as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_is64iygo.DashboardSummary?>()) {
      return (data != null ? _is64iygo.DashboardSummary.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i792y5r1.FoodCategory?>()) {
      return (data != null ? _i792y5r1.FoodCategory.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_isa7q0n4.ItemStatus?>()) {
      return (data != null ? _isa7q0n4.ItemStatus.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i8uqnvll.MealSuggestion?>()) {
      return (data != null ? _i8uqnvll.MealSuggestion.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_igjvgfoi.PantryItem?>()) {
      return (data != null ? _igjvgfoi.PantryItem.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ik328j7n.StorageType?>()) {
      return (data != null ? _ik328j7n.StorageType.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_if1uqcdu.UserProfile?>()) {
      return (data != null ? _if1uqcdu.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iyk67ys5.UserRole?>()) {
      return (data != null ? _iyk67ys5.UserRole.fromJson(data) : null) as T;
    }
    if (t == List<_igjvgfoi.PantryItem>) {
      return (data as List)
              .map((e) => deserialize<_igjvgfoi.PantryItem>(e))
              .toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i5k0mlmn.PantryItem>) {
      return (data as List)
              .map((e) => deserialize<_i5k0mlmn.PantryItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i70xmvmx.MealSuggestion>) {
      return (data as List)
              .map((e) => deserialize<_i70xmvmx.MealSuggestion>(e))
              .toList()
          as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _izw8z7ou.Greeting => 'Greeting',
      _is64iygo.DashboardSummary => 'DashboardSummary',
      _i792y5r1.FoodCategory => 'FoodCategory',
      _isa7q0n4.ItemStatus => 'ItemStatus',
      _i8uqnvll.MealSuggestion => 'MealSuggestion',
      _igjvgfoi.PantryItem => 'PantryItem',
      _ik328j7n.StorageType => 'StorageType',
      _if1uqcdu.UserProfile => 'UserProfile',
      _iyk67ys5.UserRole => 'UserRole',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('savebite.', '');
    }

    switch (data) {
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _is64iygo.DashboardSummary():
        return 'DashboardSummary';
      case _i792y5r1.FoodCategory():
        return 'FoodCategory';
      case _isa7q0n4.ItemStatus():
        return 'ItemStatus';
      case _i8uqnvll.MealSuggestion():
        return 'MealSuggestion';
      case _igjvgfoi.PantryItem():
        return 'PantryItem';
      case _ik328j7n.StorageType():
        return 'StorageType';
      case _if1uqcdu.UserProfile():
        return 'UserProfile';
      case _iyk67ys5.UserRole():
        return 'UserRole';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'DashboardSummary') {
      return deserialize<_is64iygo.DashboardSummary>(data['data']);
    }
    if (dataClassName == 'FoodCategory') {
      return deserialize<_i792y5r1.FoodCategory>(data['data']);
    }
    if (dataClassName == 'ItemStatus') {
      return deserialize<_isa7q0n4.ItemStatus>(data['data']);
    }
    if (dataClassName == 'MealSuggestion') {
      return deserialize<_i8uqnvll.MealSuggestion>(data['data']);
    }
    if (dataClassName == 'PantryItem') {
      return deserialize<_igjvgfoi.PantryItem>(data['data']);
    }
    if (dataClassName == 'StorageType') {
      return deserialize<_ik328j7n.StorageType>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_if1uqcdu.UserProfile>(data['data']);
    }
    if (dataClassName == 'UserRole') {
      return deserialize<_iyk67ys5.UserRole>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('savebite', this);
    _iacc.Protocol().registerHostProtocol('savebite', this);
  }

  @override
  String getModuleName() => 'savebite';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
