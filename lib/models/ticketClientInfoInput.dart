import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'ticketClientInfoInput.g.dart';

@JsonSerializable()
class TicketClientInfoInput {
  String batchId;
  String name;
  String cpf;
  bool isOwner;
  bool halfPrice;

  TicketClientInfoInput({
    required this.batchId,
    required this.name,
    required this.cpf,
    required this.halfPrice,
    required this.isOwner,
  });

  factory TicketClientInfoInput.fromJson(Map<String, dynamic> json) =>
      _$TicketClientInfoInputFromJson(json);

  Map<String, dynamic> toJson() => _$TicketClientInfoInputToJson(this);
}
