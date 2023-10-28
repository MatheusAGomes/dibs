import 'dart:ffi';

import 'package:dibs/models/ticketClient.dart';
import 'package:dibs/models/ticketClientInfoInput.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticketClientInput.g.dart';

@JsonSerializable()
class TicketClientInput {
  List<TicketClient> ticketClients;

  TicketClientInput({
    required this.ticketClients,
  });

  factory TicketClientInput.fromJson(Map<String, dynamic> json) =>
      _$TicketClientInputFromJson(json);

  Map<String, dynamic> toJson() => _$TicketClientInputToJson(this);
}
