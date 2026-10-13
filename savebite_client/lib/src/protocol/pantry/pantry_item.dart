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
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import '../pantry/food_category.dart' as _ie68b2vt;
import '../pantry/item_status.dart' as _ip7bfg9w;
import '../pantry/storage_type.dart' as _ih18g3vi;

abstract class PantryItem
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
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
    required _isc.UuidValue userId,
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
      userId: _isc.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      name: jsonSerialization['name'] as String,
      category: _ie68b2vt.FoodCategory.fromJson(
        (jsonSerialization['category'] as String),
      ),
      quantity: (jsonSerialization['quantity'] as num).toDouble(),
      unit: jsonSerialization['unit'] as String,
      storageType: _ih18g3vi.StorageType.fromJson(
        (jsonSerialization['storageType'] as String),
      ),
      purchaseDate: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['purchaseDate'],
      ),
      expirationDate: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['expirationDate'],
      ),
      cost: (jsonSerialization['cost'] as num?)?.toDouble(),
      notes: jsonSerialization['notes'] as String?,
      status: _ip7bfg9w.ItemStatus.fromJson(
        (jsonSerialization['status'] as String),
      ),
      consumedAt: jsonSerialization['consumedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(
              jsonSerialization['consumedAt'],
            ),
      wastedAt: jsonSerialization['wastedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['wastedAt']),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _isc.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _isc.UuidValue userId;

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

  /// Returns a shallow copy of this [PantryItem]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  PantryItem copyWith({
    int? id,
    _isc.UuidValue? userId,
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

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PantryItemImpl extends PantryItem {
  _PantryItemImpl({
    int? id,
    required _isc.UuidValue userId,
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
  @_isc.useResult
  @override
  PantryItem copyWith({
    Object? id = _Undefined,
    _isc.UuidValue? userId,
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
