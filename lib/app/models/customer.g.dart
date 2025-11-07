// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String?,
      fax: json['fax'] as String?,
      address: json['address'] as String?,
      companyName: json['company_name'] as String?,
      internalNumber: json['internal_number'] as String?,
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      notes: json['notes'] as String?,
    )
      ..total = (json['total_revenue'] as num).toInt()
      ..totalDue = (json['total_due'] as num).toInt();

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'fax': instance.fax,
      'address': instance.address,
      'company_name': instance.companyName,
      'internal_number': instance.internalNumber,
      'rating': instance.rating,
      'notes': instance.notes,
      'total_revenue': instance.total,
      'total_due': instance.totalDue,
    };
