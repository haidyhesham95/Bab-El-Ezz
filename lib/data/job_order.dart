import 'package:bab_el_ezz/data/car.dart';
import 'package:bab_el_ezz/data/spare_invoice.dart';
import 'package:bab_el_ezz/data/technician.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_order.g.dart';

@JsonSerializable()
class JobOrder {
  String? id;
  @JsonKey(name: 'car', toJson: carToJson)
  Car? car;
  String? clientName;
  String? phoneNumber;
  String? maintenanceType;
  @JsonKey(toJson: techListToJson)
  List<Technician>? technicians;
  String? notes;

  bool finished = false;
  DateTime? startDate;
  DateTime? endDate;
  @JsonKey(toJson: invoiceToJson)
  SpareInvoice? invoice;
  String? paymentType;
  String? carImage;

  JobOrder(
      {this.car,
      this.clientName,
      this.phoneNumber,
      this.finished = false,
      this.startDate,
      this.endDate,
      this.technicians,
      this.invoice,
      this.notes,
      this.maintenanceType,
      this.paymentType,
      this.carImage});

  JobOrder.empty() {
    car = Car.empty();
    phoneNumber = '';
    clientName = '';
    notes = '';
    technicians = [];
    invoice = SpareInvoice.empty();
    finished = false;
    startDate = DateTime.now();
    endDate = DateTime.now();
    carImage = '';
  }

  factory JobOrder.fromFirestore(DocumentSnapshot doc) =>
      JobOrder.fromJson(doc.data()! as Map<String, dynamic>)..id = doc.id;

  factory JobOrder.fromJson(Map<String, dynamic> json) =>
      _$JobOrderFromJson(json);

  Map<String, dynamic> toJson() => _$JobOrderToJson(this);

  static Map<String, dynamic>? carToJson(Car? car) => car?.toJson();

  static List<Map<String, dynamic>>? techListToJson(List<Technician>? techs) =>
      techs?.map((e) => e.toJson()).toList();

  static Map<String, dynamic>? invoiceToJson(SpareInvoice? invoice) =>
      invoice?.toJson();
}
