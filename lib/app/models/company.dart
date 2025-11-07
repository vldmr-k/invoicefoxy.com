import 'package:invoicefoxy_all/app/models/user.dart';
import 'package:nylo_framework/nylo_framework.dart';
import "package:pocketbase/pocketbase.dart";
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company extends Model {
  String id;

  String name;
  @JsonKey(name: "short_name")
  String shortName;

  String number;
  String phone;
  String email;
  String website;
  String address;
  String license;
  String createdby;

  String country;
  String currency;

  static StorageKey key = "companies";
  
  Company({
    this.id = '',
    this.name = '',
    this.shortName = '',
    this.number = '',
    this.phone = '',
    this.email = '',
    this.website = '',
    this.address = '',
    this.license = '',
    this.createdby = '',
    this.country = '',
    this.currency = '',
  }) : super(key: key);
  
  /// Creates a new User instance form the provided RecordModel.
  factory Company.fromRecord(RecordModel record) => Company.fromJson(record.toJson());
  
  /// Connect the generated [_$Company] function to the `fromJson` factory.
  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  /// Connect the generated [_$Company] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
