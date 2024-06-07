import 'package:bab_el_ezz/data/invoice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'merchant_invoice.g.dart';

@JsonSerializable()
class MerchantInvoice extends Invoice {
  double? totalPrice;
  double? totalPaid;
  double? totalRemaining;
  DateTime? checkDate;

  MerchantInvoice(
      {required String imagePath,
      required String invoiceNumber,
      required String clientName,
      required DateTime date,
      this.totalPrice,
      this.totalPaid,
      this.totalRemaining,
      this.checkDate})
      : super(
            invoiceNumber: invoiceNumber,
            imagePath: imagePath,
            date: date,
            clientName: clientName,
            phoneNumber: '');

  factory MerchantInvoice.fromFirestore(DocumentSnapshot doc) =>
      MerchantInvoice.fromJson(doc.data()! as Map<String, dynamic>)
        ..invoiceNumber = doc.id;

  factory MerchantInvoice.fromJson(Map<String, dynamic> json) =>
      _$MerchantInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantInvoiceToJson(this);
}
