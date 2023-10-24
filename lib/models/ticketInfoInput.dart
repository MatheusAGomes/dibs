import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'ticketInfoInput.g.dart';

@JsonSerializable()
class TicketInfoInput {
  String name;
  String cpf;
  bool isOwner;
  bool halfPrice;

  TicketInfoInput({
    required this.name,
    required this.cpf,
    required this.halfPrice,
    required this.isOwner,
  });

  factory TicketInfoInput.fromJson(Map<String, dynamic> json) =>
      _$TicketInfoInputFromJson(json);

  Map<String, dynamic> toJson() => _$TicketInfoInputToJson(this);
}
