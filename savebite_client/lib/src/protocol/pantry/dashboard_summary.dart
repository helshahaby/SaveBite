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
import '../pantry/pantry_item.dart' as _iqqaq7fa;

abstract class DashboardSummary
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  DashboardSummary._({
    required this.totalItemsTracked,
    required this.itemsExpiringSoon,
    required this.itemsExpired,
    required this.itemsConsumed,
    required this.itemsWasted,
    required this.estimatedMoneySaved,
    required this.estimatedMoneyWasted,
    required this.co2AvoidedKg,
    required this.useFirstItems,
  });

  factory DashboardSummary({
    required int totalItemsTracked,
    required int itemsExpiringSoon,
    required int itemsExpired,
    required int itemsConsumed,
    required int itemsWasted,
    required double estimatedMoneySaved,
    required double estimatedMoneyWasted,
    required double co2AvoidedKg,
    required List<_iqqaq7fa.PantryItem> useFirstItems,
  }) = _DashboardSummaryImpl;

  factory DashboardSummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return DashboardSummary(
      totalItemsTracked: jsonSerialization['totalItemsTracked'] as int,
      itemsExpiringSoon: jsonSerialization['itemsExpiringSoon'] as int,
      itemsExpired: jsonSerialization['itemsExpired'] as int,
      itemsConsumed: jsonSerialization['itemsConsumed'] as int,
      itemsWasted: jsonSerialization['itemsWasted'] as int,
      estimatedMoneySaved: (jsonSerialization['estimatedMoneySaved'] as num)
          .toDouble(),
      estimatedMoneyWasted: (jsonSerialization['estimatedMoneyWasted'] as num)
          .toDouble(),
      co2AvoidedKg: (jsonSerialization['co2AvoidedKg'] as num).toDouble(),
      useFirstItems: _i5gxi1ji.Protocol()
          .deserialize<List<_iqqaq7fa.PantryItem>>(
            jsonSerialization['useFirstItems'],
          ),
    );
  }

  int totalItemsTracked;

  int itemsExpiringSoon;

  int itemsExpired;

  int itemsConsumed;

  int itemsWasted;

  double estimatedMoneySaved;

  double estimatedMoneyWasted;

  double co2AvoidedKg;

  List<_iqqaq7fa.PantryItem> useFirstItems;

  /// Returns a shallow copy of this [DashboardSummary]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  DashboardSummary copyWith({
    int? totalItemsTracked,
    int? itemsExpiringSoon,
    int? itemsExpired,
    int? itemsConsumed,
    int? itemsWasted,
    double? estimatedMoneySaved,
    double? estimatedMoneyWasted,
    double? co2AvoidedKg,
    List<_iqqaq7fa.PantryItem>? useFirstItems,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DashboardSummary',
      'totalItemsTracked': totalItemsTracked,
      'itemsExpiringSoon': itemsExpiringSoon,
      'itemsExpired': itemsExpired,
      'itemsConsumed': itemsConsumed,
      'itemsWasted': itemsWasted,
      'estimatedMoneySaved': estimatedMoneySaved,
      'estimatedMoneyWasted': estimatedMoneyWasted,
      'co2AvoidedKg': co2AvoidedKg,
      'useFirstItems': useFirstItems.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DashboardSummary',
      'totalItemsTracked': totalItemsTracked,
      'itemsExpiringSoon': itemsExpiringSoon,
      'itemsExpired': itemsExpired,
      'itemsConsumed': itemsConsumed,
      'itemsWasted': itemsWasted,
      'estimatedMoneySaved': estimatedMoneySaved,
      'estimatedMoneyWasted': estimatedMoneyWasted,
      'co2AvoidedKg': co2AvoidedKg,
      'useFirstItems': useFirstItems.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _DashboardSummaryImpl extends DashboardSummary {
  _DashboardSummaryImpl({
    required int totalItemsTracked,
    required int itemsExpiringSoon,
    required int itemsExpired,
    required int itemsConsumed,
    required int itemsWasted,
    required double estimatedMoneySaved,
    required double estimatedMoneyWasted,
    required double co2AvoidedKg,
    required List<_iqqaq7fa.PantryItem> useFirstItems,
  }) : super._(
         totalItemsTracked: totalItemsTracked,
         itemsExpiringSoon: itemsExpiringSoon,
         itemsExpired: itemsExpired,
         itemsConsumed: itemsConsumed,
         itemsWasted: itemsWasted,
         estimatedMoneySaved: estimatedMoneySaved,
         estimatedMoneyWasted: estimatedMoneyWasted,
         co2AvoidedKg: co2AvoidedKg,
         useFirstItems: useFirstItems,
       );

  /// Returns a shallow copy of this [DashboardSummary]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  DashboardSummary copyWith({
    int? totalItemsTracked,
    int? itemsExpiringSoon,
    int? itemsExpired,
    int? itemsConsumed,
    int? itemsWasted,
    double? estimatedMoneySaved,
    double? estimatedMoneyWasted,
    double? co2AvoidedKg,
    List<_iqqaq7fa.PantryItem>? useFirstItems,
  }) {
    return DashboardSummary(
      totalItemsTracked: totalItemsTracked ?? this.totalItemsTracked,
      itemsExpiringSoon: itemsExpiringSoon ?? this.itemsExpiringSoon,
      itemsExpired: itemsExpired ?? this.itemsExpired,
      itemsConsumed: itemsConsumed ?? this.itemsConsumed,
      itemsWasted: itemsWasted ?? this.itemsWasted,
      estimatedMoneySaved: estimatedMoneySaved ?? this.estimatedMoneySaved,
      estimatedMoneyWasted: estimatedMoneyWasted ?? this.estimatedMoneyWasted,
      co2AvoidedKg: co2AvoidedKg ?? this.co2AvoidedKg,
      useFirstItems:
          useFirstItems ??
          this.useFirstItems.map((e0) => e0.copyWith()).toList(),
    );
  }
}
