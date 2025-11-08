import 'package:nylo_framework/nylo_framework.dart';
import 'package:json_annotation/json_annotation.dart';
import "package:pocketbase/pocketbase.dart";

part 'customer.g.dart';

@JsonSerializable()
class Customer extends Model {


  String id;
  String name;
  String? email;
  String? phone;
  String? fax;
  String? address;

  @JsonKey(name: "company_name")
  String? companyName;

  @JsonKey(name: "internal_number")
  String? internalNumber;

  int rating = 0;

  String? notes;

  @JsonKey(name: "total_revenue")
  int total = 0;
  @JsonKey(name: "total_due")
  int totalDue = 0;

  static StorageKey key = "clients";
  
  Customer({
    this.id = '',
    this.name = '',
    this.email,
    this.phone,
    this.fax,
    this.address,
    this.companyName,
    this.internalNumber,
    this.rating = 0,
    this.notes
  }) : super(key: key);
  
  /// Connect the generated [_$Customer] function to the `fromJson` factory.
  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  // /// Connect the generated [_$Client] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
