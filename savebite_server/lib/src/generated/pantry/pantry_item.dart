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
import 'package:serverpod/serverpod.dart' as _is;
import '../pantry/food_category.dart' as _ie68b2vt;
import '../pantry/item_status.dart' as _ip7bfg9w;
import '../pantry/storage_type.dart' as _ih18g3vi;

abstract class PantryItem
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  PantryItem._({
    this.id,
    required this.userId,
    required this.name,
    required this.category,
    required this.quantity,
    required this.unit,
    required this.storageType,
    required this.purchaseDate,
    required this.expirationDate,
    this.cost,
    this.notes,
    required this.status,
    this.consumedAt,
    this.wastedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory PantryItem({
    int? id,
    required _is.UuidValue userId,
    required String name,
    required _ie68b2vt.FoodCategory category,
    required double quantity,
    required String unit,
    required _ih18g3vi.StorageType storageType,
    required DateTime purchaseDate,
    required DateTime expirationDate,
    double? cost,
    String? notes,
    required _ip7bfg9w.ItemStatus status,
    DateTime? consumedAt,
    DateTime? wastedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PantryItemImpl;

  factory PantryItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return PantryItem(
      id: jsonSerialization['id'] as int?,
      userId: _is.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      name: jsonSerialization['name'] as String,
      category: _ie68b2vt.FoodCategory.fromJson(
        (jsonSerialization['category'] as String),
      ),
      quantity: (jsonSerialization['quantity'] as num).toDouble(),
      unit: jsonSerialization['unit'] as String,
      storageType: _ih18g3vi.StorageType.fromJson(
        (jsonSerialization['storageType'] as String),
      ),
      purchaseDate: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['purchaseDate'],
      ),
      expirationDate: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['expirationDate'],
      ),
      cost: (jsonSerialization['cost'] as num?)?.toDouble(),
      notes: jsonSerialization['notes'] as String?,
      status: _ip7bfg9w.ItemStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      consumedAt: jsonSerialization['consumedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['consumedAt']),
      wastedAt: jsonSerialization['wastedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['wastedAt']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = PantryItemTable();

  static const db = PantryItemRepository._();

  @override
  int? id;

  _is.UuidValue userId;

  String name;

  _ie68b2vt.FoodCategory category;

  double quantity;

  String unit;

  _ih18g3vi.StorageType storageType;

  DateTime purchaseDate;

  DateTime expirationDate;

  double? cost;

  String? notes;

  _ip7bfg9w.ItemStatus status;

  DateTime? consumedAt;

  DateTime? wastedAt;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [PantryItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  PantryItem copyWith({
    int? id,
    _is.UuidValue? userId,
    String? name,
    _ie68b2vt.FoodCategory? category,
    double? quantity,
    String? unit,
    _ih18g3vi.StorageType? storageType,
    DateTime? purchaseDate,
    DateTime? expirationDate,
    double? cost,
    String? notes,
    _ip7bfg9w.ItemStatus? status,
    DateTime? consumedAt,
    DateTime? wastedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PantryItem',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'name': name,
      'category': category.toJson(),
      'quantity': quantity,
      'unit': unit,
      'storageType': storageType.toJson(),
      'purchaseDate': purchaseDate.toJson(),
      'expirationDate': expirationDate.toJson(),
      if (cost != null) 'cost': cost,
      if (notes != null) 'notes': notes,
      'status': status.toJson(),
      if (consumedAt != null) 'consumedAt': consumedAt?.toJson(),
      if (wastedAt != null) 'wastedAt': wastedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PantryItem',
      if (id != null) 'id': id,
      'userId': userId.toJson(),
      'name': name,
      'category': category.toJson(),
      'quantity': quantity,
      'unit': unit,
      'storageType': storageType.toJson(),
      'purchaseDate': purchaseDate.toJson(),
      'expirationDate': expirationDate.toJson(),
      if (cost != null) 'cost': cost,
      if (notes != null) 'notes': notes,
      'status': status.toJson(),
      if (consumedAt != null) 'consumedAt': consumedAt?.toJson(),
      if (wastedAt != null) 'wastedAt': wastedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static PantryItemInclude include() {
    return PantryItemInclude._();
  }

  static PantryItemIncludeList includeList({
    _is.WhereExpressionBuilder<PantryItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PantryItemTable>? orderBy,
    _is.OrderByListBuilder<PantryItemTable>? orderByList,
    PantryItemInclude? include,
  }) {
    return PantryItemIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PantryItem.t),
      orderByList: orderByList?.call(PantryItem.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PantryItemImpl extends PantryItem {
  _PantryItemImpl({
    int? id,
    required _is.UuidValue userId,
    required String name,
    required _ie68b2vt.FoodCategory category,
    required double quantity,
    required String unit,
    required _ih18g3vi.StorageType storageType,
    required DateTime purchaseDate,
    required DateTime expirationDate,
    double? cost,
    String? notes,
    required _ip7bfg9w.ItemStatus status,
    DateTime? consumedAt,
    DateTime? wastedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         userId: userId,
         name: name,
         category: category,
         quantity: quantity,
         unit: unit,
         storageType: storageType,
         purchaseDate: purchaseDate,
         expirationDate: expirationDate,
         cost: cost,
         notes: notes,
         status: status,
         consumedAt: consumedAt,
         wastedAt: wastedAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [PantryItem]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  PantryItem copyWith({
    Object? id = _Undefined,
    _is.UuidValue? userId,
    String? name,
    _ie68b2vt.FoodCategory? category,
    double? quantity,
    String? unit,
    _ih18g3vi.StorageType? storageType,
    DateTime? purchaseDate,
    DateTime? expirationDate,
    Object? cost = _Undefined,
    Object? notes = _Undefined,
    _ip7bfg9w.ItemStatus? status,
    Object? consumedAt = _Undefined,
    Object? wastedAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PantryItem(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      storageType: storageType ?? this.storageType,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      expirationDate: expirationDate ?? this.expirationDate,
      cost: cost is double? ? cost : this.cost,
      notes: notes is String? ? notes : this.notes,
      status: status ?? this.status,
      consumedAt: consumedAt is DateTime? ? consumedAt : this.consumedAt,
      wastedAt: wastedAt is DateTime? ? wastedAt : this.wastedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class PantryItemUpdateTable extends _is.UpdateTable<PantryItemTable> {
  PantryItemUpdateTable(super.table);

  _is.ColumnValue<_is.UuidValue, _is.UuidValue> userId(_is.UuidValue value) =>
      _is.ColumnValue(
        table.userId,
        value,
      );

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<_ie68b2vt.FoodCategory, _ie68b2vt.FoodCategory> category(
    _ie68b2vt.FoodCategory value,
  ) => _is.ColumnValue(
    table.category,
    value,
  );

  _is.ColumnValue<double, double> quantity(double value) => _is.ColumnValue(
    table.quantity,
    value,
  );

  _is.ColumnValue<String, String> unit(String value) => _is.ColumnValue(
    table.unit,
    value,
  );

  _is.ColumnValue<_ih18g3vi.StorageType, _ih18g3vi.StorageType> storageType(
    _ih18g3vi.StorageType value,
  ) => _is.ColumnValue(
    table.storageType,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> purchaseDate(DateTime value) =>
      _is.ColumnValue(
        table.purchaseDate,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> expirationDate(DateTime value) =>
      _is.ColumnValue(
        table.expirationDate,
        value,
      );

  _is.ColumnValue<double, double> cost(double? value) => _is.ColumnValue(
    table.cost,
    value,
  );

  _is.ColumnValue<String, String> notes(String? value) => _is.ColumnValue(
    table.notes,
    value,
  );

  _is.ColumnValue<_ip7bfg9w.ItemStatus, _ip7bfg9w.ItemStatus> status(
    _ip7bfg9w.ItemStatus value,
  ) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> consumedAt(DateTime? value) =>
      _is.ColumnValue(
        table.consumedAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> wastedAt(DateTime? value) =>
      _is.ColumnValue(
        table.wastedAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );
}

class PantryItemTable extends _is.Table<int?> {
  PantryItemTable({super.tableRelation}) : super(tableName: 'pantry_item') {
    updateTable = PantryItemUpdateTable(this);
    userId = _is.ColumnUuid(
      'userId',
      this,
    );
    name = _is.ColumnString(
      'name',
      this,
    );
    category = _is.ColumnEnum(
      'category',
      this,
      _is.EnumSerialization.byName,
    );
    quantity = _is.ColumnDouble(
      'quantity',
      this,
    );
    unit = _is.ColumnString(
      'unit',
      this,
    );
    storageType = _is.ColumnEnum(
      'storageType',
      this,
      _is.EnumSerialization.byName,
    );
    purchaseDate = _is.ColumnDateTime(
      'purchaseDate',
      this,
    );
    expirationDate = _is.ColumnDateTime(
      'expirationDate',
      this,
    );
    cost = _is.ColumnDouble(
      'cost',
      this,
    );
    notes = _is.ColumnString(
      'notes',
      this,
    );
    status = _is.ColumnEnum(
      'status',
      this,
      _is.EnumSerialization.byName,
    );
    consumedAt = _is.ColumnDateTime(
      'consumedAt',
      this,
    );
    wastedAt = _is.ColumnDateTime(
      'wastedAt',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final PantryItemUpdateTable updateTable;

  late final _is.ColumnUuid userId;

  late final _is.ColumnString name;

  late final _is.ColumnEnum<_ie68b2vt.FoodCategory> category;

  late final _is.ColumnDouble quantity;

  late final _is.ColumnString unit;

  late final _is.ColumnEnum<_ih18g3vi.StorageType> storageType;

  late final _is.ColumnDateTime purchaseDate;

  late final _is.ColumnDateTime expirationDate;

  late final _is.ColumnDouble cost;

  late final _is.ColumnString notes;

  late final _is.ColumnEnum<_ip7bfg9w.ItemStatus> status;

  late final _is.ColumnDateTime consumedAt;

  late final _is.ColumnDateTime wastedAt;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    userId,
    name,
    category,
    quantity,
    unit,
    storageType,
    purchaseDate,
    expirationDate,
    cost,
    notes,
    status,
    consumedAt,
    wastedAt,
    createdAt,
    updatedAt,
  ];
}

class PantryItemInclude extends _is.IncludeObject {
  PantryItemInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => PantryItem.t;
}

class PantryItemIncludeList extends _is.IncludeList {
  PantryItemIncludeList._({
    _is.WhereExpressionBuilder<PantryItemTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(PantryItem.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => PantryItem.t;
}

class PantryItemRepository {
  const PantryItemRepository._();

  /// Returns a list of [PantryItem]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<PantryItem>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PantryItemTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PantryItemTable>? orderBy,
    _is.OrderByListBuilder<PantryItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<PantryItem>(
      where: where?.call(PantryItem.t),
      orderBy: orderBy?.call(PantryItem.t),
      orderByList: orderByList?.call(PantryItem.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [PantryItem] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<PantryItem?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PantryItemTable>? where,
    int? offset,
    _is.OrderByBuilder<PantryItemTable>? orderBy,
    _is.OrderByListBuilder<PantryItemTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<PantryItem>(
      where: where?.call(PantryItem.t),
      orderBy: orderBy?.call(PantryItem.t),
      orderByList: orderByList?.call(PantryItem.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [PantryItem] by its [id] or null if no such row exists.
  Future<PantryItem?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<PantryItem>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [PantryItem]s in the list and returns the inserted rows.
  ///
  /// The returned [PantryItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PantryItem>> insert(
    _is.DatabaseSession session,
    List<PantryItem> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<PantryItem>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [PantryItem] and returns the inserted row.
  ///
  /// The returned [PantryItem] will have its `id` field set.
  Future<PantryItem> insertRow(
    _is.DatabaseSession session,
    PantryItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<PantryItem>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [PantryItem]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [PantryItem]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PantryItem>> upsert(
    _is.DatabaseSession session,
    List<PantryItem> rows, {
    required _is.ColumnSelections<PantryItemTable> conflictColumns,
    _is.ColumnSelections<PantryItemTable>? updateColumns,
    _is.WhereExpressionBuilder<PantryItemTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<PantryItem>(
      rows,
      conflictColumns: conflictColumns(PantryItem.t),
      updateColumns: updateColumns?.call(PantryItem.t),
      updateWhere: updateWhere?.call(PantryItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [PantryItem] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [PantryItem] will have its `id` field set.
  Future<PantryItem?> upsertRow(
    _is.DatabaseSession session,
    PantryItem row, {
    required _is.ColumnSelections<PantryItemTable> conflictColumns,
    _is.ColumnSelections<PantryItemTable>? updateColumns,
    _is.WhereExpressionBuilder<PantryItemTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<PantryItem>(
      row,
      conflictColumns: conflictColumns(PantryItem.t),
      updateColumns: updateColumns?.call(PantryItem.t),
      updateWhere: updateWhere?.call(PantryItem.t),
      transaction: transaction,
    );
  }

  /// Updates all [PantryItem]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PantryItem>> update(
    _is.DatabaseSession session,
    List<PantryItem> rows, {
    _is.ColumnSelections<PantryItemTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<PantryItem>(
      rows,
      columns: columns?.call(PantryItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [PantryItem]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<PantryItem> updateRow(
    _is.DatabaseSession session,
    PantryItem row, {
    _is.ColumnSelections<PantryItemTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<PantryItem>(
      row,
      columns: columns?.call(PantryItem.t),
      transaction: transaction,
    );
  }

  /// Updates a single [PantryItem] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<PantryItem?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<PantryItemUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<PantryItem>(
      id,
      columnValues: columnValues(PantryItem.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [PantryItem]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PantryItem>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<PantryItemUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<PantryItemTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<PantryItemTable>? orderBy,
    _is.OrderByListBuilder<PantryItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<PantryItem>(
      columnValues: columnValues(PantryItem.t.updateTable),
      where: where(PantryItem.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(PantryItem.t),
      orderByList: orderByList?.call(PantryItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [PantryItem]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PantryItem>> delete(
    _is.DatabaseSession session,
    List<PantryItem> rows, {
    _is.OrderByBuilder<PantryItemTable>? orderBy,
    _is.OrderByListBuilder<PantryItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<PantryItem>(
      rows,
      orderBy: orderBy?.call(PantryItem.t),
      orderByList: orderByList?.call(PantryItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [PantryItem].
  Future<PantryItem> deleteRow(
    _is.DatabaseSession session,
    PantryItem row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<PantryItem>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<PantryItem>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PantryItemTable> where,
    _is.OrderByBuilder<PantryItemTable>? orderBy,
    _is.OrderByListBuilder<PantryItemTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<PantryItem>(
      where: where(PantryItem.t),
      orderBy: orderBy?.call(PantryItem.t),
      orderByList: orderByList?.call(PantryItem.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<PantryItemTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<PantryItem>(
      where: where?.call(PantryItem.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [PantryItem] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<PantryItemTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<PantryItem>(
      where: where(PantryItem.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
