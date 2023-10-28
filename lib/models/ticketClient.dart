import 'dart:ffi';

import 'package:dibs/models/ticketClientInfoInput.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticketClient.g.dart';

@JsonSerializable()
class TicketClient {
  String clientId;
  String eventId;
  List<TicketClientInfoInput> ticketInfo;

  TicketClient({
    required this.clientId,
    required this.eventId,
    required this.ticketInfo,
  });

  factory TicketClient.fromJson(Map<String, dynamic> json) =>
      _$TicketClientFromJson(json);

  Map<String, dynamic> toJson() => _$TicketClientToJson(this);
}
