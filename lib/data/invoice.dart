import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Invoice {
  String? id;
  String? invoiceNumber;
  String? imagePath;

  Invoice({this.invoiceNumber, this.imagePath});
}
