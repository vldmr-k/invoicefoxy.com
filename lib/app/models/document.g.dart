// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      id: json['id'] as String? ?? '',
      companyId: json['company_id'] as String? ?? '',
      clientId: json['client_id'] as String?,
      documentType:
          $enumDecodeNullable(_$DocumentTypeEnumMap, json['document_type']) ??
              DocumentType.invoice,
      number: json['number'] as String? ?? '',
      issueDate: json['issue_date'] == null
          ? null
          : DateTime.parse(json['issue_date'] as String),
      referenceNumber: json['reference_number'] as String?,
      internalNumber: json['internal_number'] as String?,
      description: json['description'] as String?,
      notes: json['notes'] as String?,
      state: $enumDecodeNullable(_$DocumentStateEnumMap, json['state']) ??
          DocumentState.draft,
      subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
      discountType:
          $enumDecodeNullable(_$DiscounTypeEnumMap, json['discount_type']) ??
              DiscounType.none,
      discountValue: (json['discount_value'] as num?)?.toDouble() ?? 0,
      discountTotal: (json['discount_total'] as num?)?.toDouble() ?? 0,
      taxType: $enumDecodeNullable(_$TaxTypeEnumMap, json['tax_type']) ??
          TaxType.none,
      taxLabel: json['tax_label'] as String? ?? 'VAT',
      taxRate: (json['tax_rate'] as num?)?.toDouble() ?? 0.00,
      taxTotal: (json['tax_total'] as num?)?.toDouble() ?? 0.00,
      dueType: $enumDecodeNullable(_$DueTypeEnumMap, json['due_type']) ??
          DueType.onReceipt,
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      totalAmount: (json['total_amount'] as num?)?.toDouble() ?? 0,
      residualAmount: (json['residual_amount'] as num?)?.toDouble() ?? 0,
      paymentInstruction: json['payment_instruction'] as String? ?? '',
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'client_id': instance.clientId,
      'document_type': _$DocumentTypeEnumMap[instance.documentType]!,
      'number': instance.number,
      'issue_date': instance.issueDate?.toIso8601String(),
      'reference_number': instance.referenceNumber,
      'internal_number': instance.internalNumber,
      'description': instance.description,
      'notes': instance.notes,
      'state': _$DocumentStateEnumMap[instance.state]!,
      'subtotal': instance.subtotal,
      'discount_type': _$DiscounTypeEnumMap[instance.discountType]!,
      'discount_value': instance.discountValue,
      'discount_total': instance.discountTotal,
      'tax_type': _$TaxTypeEnumMap[instance.taxType]!,
      'tax_rate': instance.taxRate,
      'tax_label': instance.taxLabel,
      'tax_total': instance.taxTotal,
      'due_type': _$DueTypeEnumMap[instance.dueType]!,
      'due_date': instance.dueDate?.toIso8601String(),
      'total_amount': instance.totalAmount,
      'residual_amount': instance.residualAmount,
      'payment_instruction': instance.paymentInstruction,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$DocumentTypeEnumMap = {
  DocumentType.invoice: 'invoice',
  DocumentType.estimate: 'estimate',
};

const _$DocumentStateEnumMap = {
  DocumentState.draft: 'draft',
  DocumentState.issued: 'issued',
  DocumentState.sent: 'sent',
  DocumentState.paid: 'paid',
  DocumentState.canceled: 'canceled',
};

const _$DiscounTypeEnumMap = {
  DiscounType.fixed: 'fixed',
  DiscounType.percentage: 'percentage',
  DiscounType.none: 'none',
};

const _$TaxTypeEnumMap = {
  TaxType.perItem: 'per_item',
  TaxType.onTotal: 'on_total',
  TaxType.none: 'none',
};

const _$DueTypeEnumMap = {
  DueType.onReceipt: 'on_receipt',
  DueType.onDate: 'on_date',
};
