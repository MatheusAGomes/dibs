import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'resumoDaCompraString.g.dart';

@JsonSerializable()
class ResumoDaCompraString {
  String name;
  String tipo;
  double preco;

  ResumoDaCompraString({
    required this.name,
    required this.tipo,
    required this.preco,
  });

  factory ResumoDaCompraString.fromJson(Map<String, dynamic> json) =>
      _$ResumoDaCompraStringFromJson(json);

  Map<String, dynamic> toJson() => _$ResumoDaCompraStringToJson(this);
}
