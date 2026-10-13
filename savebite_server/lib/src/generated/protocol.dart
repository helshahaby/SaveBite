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
import 'package:savebite_server/src/generated/pantry/meal_suggestion.dart'
    as _i7w0u9g9;
import 'package:savebite_server/src/generated/pantry/pantry_item.dart'
    as _ikpe81ee;
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
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

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    _isp.TableDefinition(
      name: 'pantry_item',
      dartName: 'PantryItem',
      schema: 'public',
      module: 'savebite',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'category',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:FoodCategory',
        ),
        _isp.ColumnDefinition(
          name: 'quantity',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _isp.ColumnDefinition(
          name: 'unit',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'storageType',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:StorageType',
        ),
        _isp.ColumnDefinition(
          name: 'purchaseDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'expirationDate',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'cost',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'notes',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ItemStatus',
        ),
        _isp.ColumnDefinition(
          name: 'consumedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'wastedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'pantry_user_status_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _isp.IndexDefinition(
          indexName: 'pantry_expiration_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'expirationDate',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'user_profile',
      dartName: 'UserProfile',
      schema: 'public',
      module: 'savebite',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'authUserId',
          columnType: _isp.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _isp.ColumnDefinition(
          name: 'fullName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'role',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:UserRole',
        ),
        _isp.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'now',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _isp.IndexDefinition(
          indexName: 'user_profile_auth_user_idx',
          tableSpace: null,
          elements: [
            _isp.IndexElementDefinition(
              type: _isp.IndexElementDefinitionType.column,
              definition: 'authUserId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._iais.Protocol.targetTableDefinitions,
    ..._iacs.Protocol.targetTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
  ];

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
      } on _is.DeserializationClassNameNotFoundException catch (_) {
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
    if (t == _is.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_is64iygo.DashboardSummary?>()) {
      return (data != null ? _is64iygo.DashboardSummary.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i792y5r1.FoodCategory?>()) {
      return (data != null ? _i792y5r1.FoodCategory.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_isa7q0n4.ItemStatus?>()) {
      return (data != null ? _isa7q0n4.ItemStatus.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i8uqnvll.MealSuggestion?>()) {
      return (data != null ? _i8uqnvll.MealSuggestion.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_igjvgfoi.PantryItem?>()) {
      return (data != null ? _igjvgfoi.PantryItem.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_ik328j7n.StorageType?>()) {
      return (data != null ? _ik328j7n.StorageType.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_if1uqcdu.UserProfile?>()) {
      return (data != null ? _if1uqcdu.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_iyk67ys5.UserRole?>()) {
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
    if (t == List<_ikpe81ee.PantryItem>) {
      return (data as List)
              .map((e) => deserialize<_ikpe81ee.PantryItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i7w0u9g9.MealSuggestion>) {
      return (data as List)
              .map((e) => deserialize<_i7w0u9g9.MealSuggestion>(e))
              .toList()
          as T;
    }
    try {
      return _iais.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacs.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
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
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
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
      return _iais.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacs.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('savebite', this);
    _iacs.Protocol().registerHostProtocol('savebite', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _igjvgfoi.PantryItem:
        return _igjvgfoi.PantryItem.t;
      case _if1uqcdu.UserProfile:
        return _if1uqcdu.UserProfile.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

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
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
