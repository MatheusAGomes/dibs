//import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'autenticacao.g.dart';

@JsonSerializable()
class Autenticacao {
  String username;
  String password;

  Autenticacao({required this.username, required this.password});

  factory Autenticacao.fromJson(Map<String, dynamic> json) =>
      _$AutenticacaoFromJson(json);

  Map<String, dynamic> toJson() => _$AutenticacaoToJson(this);
}
