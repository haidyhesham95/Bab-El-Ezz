import 'package:json_annotation/json_annotation.dart';

part 'invoice.g.dart';

@JsonSerializable()
class Invoice {
  String? id;
  String clientName;
  String phoneNumber;
  DateTime date;
  String invoiceNumber;
  String imagePath;

  Invoice(
      {required this.clientName,
      required this.phoneNumber,
      required this.date,
      required this.invoiceNumber,
      required this.imagePath});
}
