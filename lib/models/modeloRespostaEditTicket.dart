import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'modeloRespostaEditTicket.g.dart';

@JsonSerializable()
class ModeloRespostaEditTicket {
  String name;
  String cpf;

  ModeloRespostaEditTicket({required this.name, required this.cpf});

  factory ModeloRespostaEditTicket.fromJson(Map<String, dynamic> json) =>
      _$ModeloRespostaEditTicketFromJson(json);

  Map<String, dynamic> toJson() => _$ModeloRespostaEditTicketToJson(this);
}
