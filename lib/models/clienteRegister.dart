import 'package:dibs/models/events.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:json_annotation/json_annotation.dart';
part 'clienteRegister.g.dart';

@JsonSerializable()
class ClientRegister {
  String login;
  String password;
  String firstName;
  String lastName;
  String cpf;
  DateTime birthDate;
  String phone;

  ClientRegister({
    required this.login,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.cpf,
    required this.birthDate,
    required this.phone,
  });

  factory ClientRegister.fromJson(Map<String, dynamic> json) =>
      _$ClientRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$ClientRegisterToJson(this);
}
