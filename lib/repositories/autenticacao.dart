//import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'autenticacao.g.dart';

@JsonSerializable()
class Autenticacao {
  String login;
  String password;

  Autenticacao({required this.login, required this.password});

  factory Autenticacao.fromJson(Map<String, dynamic> json) =>
      _$AutenticacaoFromJson(json);

  Map<String, dynamic> toJson() => _$AutenticacaoToJson(this);
}
