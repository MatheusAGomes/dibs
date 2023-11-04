// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clienteRegister.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientRegister _$ClientRegisterFromJson(Map<String, dynamic> json) =>
    ClientRegister(
      login: json['login'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      cpf: json['cpf'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ClientRegisterToJson(ClientRegister instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'cpf': instance.cpf,
      'birthDate': instance.birthDate.toIso8601String(),
      'phone': instance.phone,
    };
