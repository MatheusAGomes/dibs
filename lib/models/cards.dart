import 'package:json_annotation/json_annotation.dart';

part 'cards.g.dart';

@JsonSerializable()
class Cards {
  String? number;
  String? name;
  String? cpf;
  String? validity;

  Cards(
      {required this.number,
      required this.cpf,
      required this.name,
      required this.validity});

  factory Cards.fromJson(Map<String, dynamic> json) {
    return Cards(
      name: json['name'] as String,
      cpf: json['cpf'] as String,
      number: json['number'] as String,
      validity: json['validity'] as String,
    );
  }
}
