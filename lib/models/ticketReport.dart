import 'dart:ffi';

import 'package:dibs/models/ticketLote.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticketReport.g.dart';

@JsonSerializable()
class TicketReport {
  String eventName;
  String startDate;
  String time;
  bool halfPrice;
  String address;
  String batchName;
  double batchPrice;
  String transferDate;
  String transferTime;
  String transferPrice;
  String advertiser;
  String advertiserEmail;
  String buyer;
  String buyerEmail;

  TicketReport(
      {required this.eventName,
      required this.startDate,
      required this.time,
      required this.halfPrice,
      required this.address,
      required this.batchName,
      required this.batchPrice,
      required this.transferDate,
      required this.transferTime,
      required this.transferPrice,
      required this.advertiser,
      required this.advertiserEmail,
      required this.buyer,
      required this.buyerEmail});

  factory TicketReport.fromJson(Map<String, dynamic> json) =>
      _$TicketReportFromJson(json);

  Map<String, dynamic> toJson() => _$TicketReportToJson(this);
}
