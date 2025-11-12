import 'package:nylo_framework/nylo_framework.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document.g.dart';

enum DocumentState {
  @JsonValue('draft')
  draft, 

  @JsonValue('issued')
  issued, 

  @JsonValue('sent')
  sent, 

  @JsonValue('paid')
  paid, 

  @JsonValue('canceled')
  canceled
}

enum DocumentType {
  @JsonValue('invoice')
  invoice,
  @JsonValue('estimate')
  estimate
}

extension DocumentTypeLabel on DocumentType {
   String get label => 'document_type.${name}'.tr();
}

enum DueType {
  @JsonValue('on_receipt')
  onReceipt,
  @JsonValue('on_date')
  onDate
}

enum TaxType {
  @JsonValue('per_item')
  perItem,
  @JsonValue('on_total')
  onTotal,
  @JsonValue("none")
  none,
}

enum DiscounType {
  @JsonValue('fixed')
  fixed,
  @JsonValue('percentage')
  percentage,
  @JsonValue("none")
  none,
}

@JsonSerializable()
class Document extends Model {

  static StorageKey key = "documents";

  String id = '';
  
  @JsonKey(name: "company_id")
  String companyId = '';

  @JsonKey(name: "client_id")
  String? clientId;

  @JsonKey(name: "document_type")
  DocumentType documentType = DocumentType.invoice;

  String number = '';

  @JsonKey(name: "issue_date")
  DateTime? issueDate;

  @JsonKey(name: 'reference_number')
  String? referenceNumber;

  @JsonKey(name: 'internal_number')
  String? internalNumber;

  String? description;

  String? notes;

  @JsonKey(name: "state", defaultValue: DocumentState.draft)
  DocumentState state = DocumentState.draft;

  double subtotal = 0.00;

  @JsonKey(name: "discount_type", defaultValue: DiscounType.none)
  DiscounType discountType;

  @JsonKey(name: "discount_value")
  double discountValue = 0.00;

  @JsonKey(name: 'discount_total')
  double discountTotal = 0.00;

  @JsonKey(name: "tax_type", defaultValue: TaxType.none)
  TaxType taxType = TaxType.none;

  @JsonKey(name: "tax_rate")
  double taxRate = 0.00;

  @JsonKey(name: "tax_label")
  String taxLabel = '';

  @JsonKey(name: "tax_total")
  double taxTotal = 0.00;
 


  @JsonKey(name: "due_type", defaultValue: DueType.onReceipt)
  DueType dueType = DueType.onReceipt;

  @JsonKey(name: "due_date")
  DateTime? dueDate;

  @JsonKey(name: 'total_amount')
  double totalAmount = 0;

  @JsonKey(name: 'residual_amount')
  double residualAmount = 0;

  @JsonKey(name: 'payment_instruction')
  String? paymentInstruction;

  @JsonKey(name: "created_at")
  DateTime? createdAt = null;

  @JsonKey(name: "updated_at")
  DateTime? updatedAt = null;

  
  Document({
    this.id = '',
    this.companyId = '',
    this.clientId,
    this.documentType = DocumentType.invoice,
    this.number = '',
    this.issueDate,
    this.referenceNumber,
    this.internalNumber,
    this.description,
    this.notes,
    this.state = DocumentState.draft,
    this.subtotal = 0,

    //discount
    this.discountType = DiscounType.none,
    this.discountValue = 0,
    this.discountTotal = 0,

    //tax
    this.taxType = TaxType.none,
    this.taxLabel = 'VAT',
    this.taxRate = 0.00,
    this.taxTotal = 0.00,

    //due
    this.dueType = DueType.onReceipt,
    this.dueDate,

    this.totalAmount = 0,
    this.residualAmount = 0,
    this.paymentInstruction = '',

    //dates
    this.createdAt,
    this.updatedAt
  });


  /// Connect the generated [_$Item] function to the `fromJson` factory.
  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

  /// Connect the generated [_$Item] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
  
}
