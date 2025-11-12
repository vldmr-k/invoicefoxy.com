// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
      number: json['number'] as String? ?? '',
      documentType:
          $enumDecodeNullable(_$DocumentTypeEnumMap, json['document_type']) ??
              DocumentType.invoice,
      dueType: $enumDecodeNullable(_$DueTypeEnumMap, json['due_type']) ??
          DueType.onReceipt,
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      internalNumber: json['internal_number'] as String? ?? null,
      headline: json['headline'] as String? ?? null,
      notes: json['notes'] as String? ?? null,
      taxType: $enumDecodeNullable(_$TaxTypeEnumMap, json['tax_type']) ??
          TaxType.none,
      taxRate: (json['tax_rate'] as num?)?.toInt() ?? null,
      discountType:
          $enumDecodeNullable(_$DiscounTypeEnumMap, json['discount_type']) ??
              DiscounType.none,
      discountRate: (json['discount_rate'] as num?)?.toInt() ?? null,
      total: (json['total'] as num?)?.toInt() ?? 0,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'number': instance.number,
      'document_type': _$DocumentTypeEnumMap[instance.documentType]!,
      'due_type': _$DueTypeEnumMap[instance.dueType],
      'due_date': instance.dueDate?.toIso8601String(),
      'internal_number': instance.internalNumber,
      'headline': instance.headline,
      'notes': instance.notes,
      'tax_type': _$TaxTypeEnumMap[instance.taxType],
      'tax_rate': instance.taxRate,
      'discount_type': _$DiscounTypeEnumMap[instance.discountType],
      'discount_rate': instance.discountRate,
      'total': instance.total,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
    };

const _$DocumentTypeEnumMap = {
  DocumentType.invoice: 'invoice',
  DocumentType.estimate: 'estimate',
};

const _$DueTypeEnumMap = {
  DueType.onReceipt: 'on_receipt',
  DueType.customDate: 'custom_date',
  DueType.none: '',
};

const _$TaxTypeEnumMap = {
  TaxType.perItem: 'per_item',
  TaxType.onTotal: 'on_total',
  TaxType.none: '',
};

const _$DiscounTypeEnumMap = {
  DiscounType.fixed: 'fixed',
  DiscounType.percentage: 'percentage',
  DiscounType.none: '',
};
