import 'package:json_annotation/json_annotation.dart';

part 'cardInput.g.dart';

@JsonSerializable()
class CardInput {
  String number;
  String name;
  String cpf;
  String code;
  String validity;

  CardInput(
      {required this.number,
      required this.code,
      required this.cpf,
      required this.name,
      required this.validity});

  factory CardInput.fromJson(Map<String, dynamic> json) =>
      _$CardInputFromJson(json);

  Map<String, dynamic> toJson() => _$CardInputToJson(this);
}
