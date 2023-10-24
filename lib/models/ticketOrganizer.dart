import 'dart:ffi';

import 'package:dibs/models/ticketLote.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ticketInfoInput.dart';

part 'ticketOrganizer.g.dart';

@JsonSerializable()
class TicketOrganizer {
  List<TicketLote> ticketBatch;

  TicketOrganizer({
    required this.ticketBatch,
  });

  factory TicketOrganizer.fromJson(Map<String, dynamic> json) =>
      _$TicketOrganizerFromJson(json);

  Map<String, dynamic> toJson() => _$TicketOrganizerToJson(this);
}
