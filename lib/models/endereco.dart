import 'package:json_annotation/json_annotation.dart';

import '../shared/enum/EventStatus.dart';

part 'endereco.g.dart';

@JsonSerializable()
class Endereco {
  String? cep;
  String? logradouro;
  String? complemento;
  String? numero;
  String? bairro;
  String? cidade;
  String? uf;
  String? ddd;

  Endereco({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.uf,
    required this.ddd,
  });

  factory Endereco.fromJson(Map<String, dynamic> json) =>
      _$EnderecoFromJson(json);

  Map<String, dynamic> toJson() => _$EnderecoToJson(this);
}
