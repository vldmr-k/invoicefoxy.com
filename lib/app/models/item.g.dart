// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as String?,
      name: json['name'] as String? ?? "",
      description: json['description'] as String?,
      type: json['type'] == null
          ? ItemType.none
          : const ItemTypeConverter().fromJson(json['type'] as String?),
      price: json['price'] == null
          ? 0
          : const CastToNumericConverter().fromJson(json['price']),
      isTaxable: json['is_taxable'] as bool? ?? false,
      totalAmount: json['total_amount'] as num? ?? 0,
      totalSold: (json['total_sold'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$JsonConverterToJson<String?, ItemType>(
          instance.type, const ItemTypeConverter().toJson),
      'price': const CastToNumericConverter().toJson(instance.price),
      'is_taxable': instance.isTaxable,
      'total_amount': instance.totalAmount,
      'total_sold': instance.totalSold,
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
