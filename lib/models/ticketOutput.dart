import 'dart:ffi';

import 'package:dibs/models/ticketLote.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticketOutput.g.dart';

@JsonSerializable()
class TicketOutput {
  String id;
  String picture;
  String eventName;
  String address;
  String date;
  String time;
  String name;
  String cpf;
  String batchName;
  String qrCode;
  double purchasePrice;
  bool valid;
  bool halfPrice;

  TicketOutput({
    required this.id,
    required this.picture,
    required this.eventName,
    required this.address,
    required this.date,
    required this.time,
    required this.name,
    required this.cpf,
    required this.batchName,
    required this.qrCode,
    required this.purchasePrice,
    required this.valid,
    required this.halfPrice,
  });

  factory TicketOutput.fromJson(Map<String, dynamic> json) =>
      _$TicketOutputFromJson(json);

  Map<String, dynamic> toJson() => _$TicketOutputToJson(this);
}
