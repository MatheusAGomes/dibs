// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clientInput.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientInput _$ClientInputFromJson(Map<String, dynamic> json) => ClientInput(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      cpf: json['cpf'] as String?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ClientInputToJson(ClientInput instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'cpf': instance.cpf,
      'birthDate': instance.birthDate?.toIso8601String(),
      'phone': instance.phone,
    };
