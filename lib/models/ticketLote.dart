import 'dart:ffi';
import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

import 'ticketInfoInput.dart';

part 'ticketLote.g.dart';

@JsonSerializable()
class TicketLote {
  String batchId;
  List<TicketInfoInput> ticketInfo;

  TicketLote({
    required this.batchId,
    required this.ticketInfo,
  });

  factory TicketLote.fromJson(Map<String, dynamic> json) =>
      _$TicketLoteFromJson(json);

  Map<String, dynamic> toJson() => _$TicketLoteToJson(this);
}
