import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class Card {
  String number;
  String name;
  String cpf;
  String validity;

  Card(
      {required this.number,
      required this.cpf,
      required this.name,
      required this.validity});

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      name: json['name'] as String,
      cpf: json['cpf'] as String,
      number: json['number'] as String,
      validity: json['validity'] as String,
    );
  }
}
