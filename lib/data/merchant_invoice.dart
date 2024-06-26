import 'package:bab_el_ezz/data/invoice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'merchant_invoice.g.dart';

@JsonSerializable()
class MerchantInvoice extends Invoice {
  double? totalPaid;
  double? totalRemaining;
  DateTime? checkDate;

  MerchantInvoice(double price,
      {required String imagePath,
      required String invoiceNumber,
      required String clientName,
      required DateTime date,
      required this.totalPaid,
      required this.totalRemaining,
      required this.checkDate})
      : super(
            price: price,
            invoiceNumber: invoiceNumber,
            imagePath: imagePath,
            date: date,
            clientName: clientName,
            phoneNumber: '');

  factory MerchantInvoice.fromFirestore(DocumentSnapshot doc) =>
      MerchantInvoice.fromJson(doc.data()! as Map<String, dynamic>)
        ..id = doc.id;

  factory MerchantInvoice.fromJson(Map<String, dynamic> json) =>
      _$MerchantInvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$MerchantInvoiceToJson(this);
}
