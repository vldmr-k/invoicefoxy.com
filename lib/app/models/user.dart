import 'package:nylo_framework/nylo_framework.dart';
import "package:pocketbase/pocketbase.dart";
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Model {
  String id;
  String name;
  String email;
  String avatar;
  bool verified;

  static StorageKey key = 'user';

  User({
    this.id = '',
    this.name = '',
    this.email = '',
    this.avatar = '',
    this.verified = false
  }) : super(key: key);

  /// Creates a new User instance form the provided RecordModel.
  factory User.fromRecord(RecordModel record) => User.fromJson(record.toJson());


  /// Connect the generated [_$User] function to the `fromJson` factory.
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Connect the generated [_$User] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
