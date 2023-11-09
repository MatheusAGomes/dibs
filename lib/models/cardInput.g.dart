// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardInput.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardInput _$CardInputFromJson(Map<String, dynamic> json) => CardInput(
      number: json['number'] as String,
      code: json['code'] as String,
      cpf: json['cpf'] as String,
      name: json['name'] as String,
      validity: json['validity'] as String,
    );

Map<String, dynamic> _$CardInputToJson(CardInput instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'cpf': instance.cpf,
      'code': instance.code,
      'validity': instance.validity,
    };
