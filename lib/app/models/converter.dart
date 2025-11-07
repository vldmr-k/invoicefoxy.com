import 'package:json_annotation/json_annotation.dart';

/// Custom converter for handling dollars to pennies conversion
/// Stores in database as pennies (cents), but works with dollars in the model
class MoneyConverter extends JsonConverter<double, dynamic> {
  const MoneyConverter();

  @override
  double fromJson(dynamic json) {
    if (json == null) return 0;



    // int → dollars
    if (json is int) return json / 100;

    // string → parse then dollars
    if (json is String) {
      final value = int.tryParse(json) ?? 0;
      return value / 100;
    }

    // num → dollars
    if (json is num) return json.toInt() / 100;

    throw ArgumentError('Invalid price format: $json');
  }

  @override
  int toJson(double object) {
    // Convert dollars → pennies
    return (object * 100).toInt(); // or .toInt() if you prefer
  }
}


class CastToNumericConverter extends JsonConverter<num, dynamic> {
  const CastToNumericConverter()
    : super();


  @override
  num fromJson(dynamic json) {
    if (json == null) return 0;

    // int → dollars
    if (json is int || json is num || json is double) return json;

    // string → parse then dollars
    if (json is String) {
      return num.tryParse(json) ?? 0;
    }

    throw ArgumentError('Invalid value format: $json');
  }

  @override
  num toJson(num object) {
    return object; 
  }
}
