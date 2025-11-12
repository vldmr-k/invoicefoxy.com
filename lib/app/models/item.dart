import 'package:flutter/widgets.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:json_annotation/json_annotation.dart';
import 'converter.dart';

part 'item.g.dart';


class ItemTypeConverter implements JsonConverter<ItemType, String?> {
  const ItemTypeConverter();

  static const Map<String, ItemType> casts = {
    "hour": ItemType.hour,
    "day": ItemType.day,
    "unit": ItemType.unit,
    "": ItemType.none,
    "none": ItemType.none,
  };

  @override
  ItemType fromJson(String? value) {
    return ItemTypeConverter.casts[value?.toLowerCase()] ?? ItemType.none;
  }

  @override
  String? toJson(ItemType type) {
    return type != ItemType.none ? type.name : null;
  }
}


enum ItemType {
  @JsonValue("hour") hour,
  @JsonValue("day") day,
  @JsonValue("unit") unit,
  @JsonValue(null) none,
}

@JsonSerializable()
class Item extends Model {

  static StorageKey key = "items";

  String? id;
  String name;
  String? description;

  @ItemTypeConverter() 
  ItemType? type;

  @CastToNumericConverter()
  num price = 0;

  @JsonKey(name: "is_taxable")
  bool isTaxable = false;

  @JsonKey(name: "total_amount")
  num totalAmount = 0;

  @JsonKey(name: "total_sold")
  int totalSold = 0;
  
  Item({
    this.id,
    this.name = "",
    this.description,
    this.type = ItemType.none,
    this.price = 0,
    this.isTaxable = false,
    this.totalAmount = 0,
    this.totalSold = 0,
  }) : super(key: key);


  /// Connect the generated [_$Item] function to the `fromJson` factory.
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  /// Connect the generated [_$Item] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
