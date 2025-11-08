import 'package:nylo_framework/nylo_framework.dart';
import 'package:json_annotation/json_annotation.dart';
import "package:pocketbase/pocketbase.dart";

part 'invoice.g.dart';

enum DocumentType {
  @JsonValue('invoice')
  invoice,
  @JsonValue('estimate')
  estimate,
}

enum DueType {
  @JsonValue('on_receipt')
  onReceipt,
  @JsonValue('custom_date')
  customDate,
  @JsonValue("")
  none
}

enum TaxType {
  @JsonValue('per_item')
  perItem,
  @JsonValue('on_total')
  onTotal,
  @JsonValue("")
  none,
}

enum DiscounType {
  @JsonValue('fixed')
  fixed,
  @JsonValue('percentage')
  percentage,
  @JsonValue("")
  none,
}

@JsonSerializable()
class Invoice extends Model {

  static StorageKey key = "invoices";

  String id = '';
  String type = '';
  String number = '';

  @JsonKey(name: "document_type")
  DocumentType documentType = DocumentType.invoice;

  @JsonKey(name: "due_type")
  DueType? dueType;

  @JsonKey(name: "due_date")
  DateTime? dueDate;

  @JsonKey(name: "internal_number")
  String? internalNumber;

  @JsonKey(name: "headline")
  String? headline;

  @JsonKey(name: "notes")
  String? notes;

  @JsonKey(name: "tax_type")
  TaxType? taxType;

  @JsonKey(name: "tax_rate")
  int? taxRate;

  @JsonKey(name: "discount_type", defaultValue: DiscounType.none)
  DiscounType? discountType;

  @JsonKey(name: "discount_rate")
  int? discountRate;

  @JsonKey(name: "total")
  int total = 0;

  @JsonKey(name: "created")
  DateTime? created = null;

  @JsonKey(name: "updated")
  DateTime? updated = null;

  
  
  Invoice({
    this.id = '',
    this.type = '',
    this.number = '',
    this.documentType = DocumentType.invoice,
    this.dueType = DueType.onReceipt,
    this.dueDate = null,
    this.internalNumber = null,
    this.headline = null,
    this.notes = null,
    this.taxType = TaxType.none,
    this.taxRate = null,
    this.discountType = DiscounType.none,
    this.discountRate = null,
    this.total = 0,
    this.created = null,
    this.updated = null,
  }) : super(key: key);

  /// Connect the generated [_$Invoice] function to the `fromJson` factory.
  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);

  /// Connect the generated [_$Invoice] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
  
}
