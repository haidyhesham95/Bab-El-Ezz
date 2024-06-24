import 'package:bab_el_ezz/data/invoice.dart';
import 'package:bab_el_ezz/data/return_part.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'return_invoice.g.dart';

@JsonSerializable()
class ReturnInvoice extends Invoice {
  String company;
  List<ReturnPart> parts;

  ReturnInvoice({
    required double price,
    required String phoneNumber,
    required String clientName,
    required this.company,
    required this.parts,
  }) : super(
            price: price,
            invoiceNumber: '',
            imagePath: '',
            date: DateTime.now(),
            clientName: clientName,
            phoneNumber: phoneNumber);

  factory ReturnInvoice.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    data['parts'] = (data['parts'] as List<dynamic>)
        .map((partJson) => partJson)
        .toList(); // Convert parts back to List<Part>
    return _$ReturnInvoiceFromJson(data);
  }

  factory ReturnInvoice.fromJson(Map<String, dynamic> json) =>
      _$ReturnInvoiceFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = _$ReturnInvoiceToJson(this);
    data['parts'] = parts
        .map((part) => part.toJson())
        .toList(); // Convert parts to List<Map<String, dynamic>>
    return data;
  }
}
