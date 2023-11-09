// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cards _$CardsFromJson(Map<String, dynamic> json) => Cards(
      number: json['number'] as String?,
      cpf: json['cpf'] as String?,
      name: json['name'] as String?,
      validity: json['validity'] as String?,
    );

Map<String, dynamic> _$CardsToJson(Cards instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'cpf': instance.cpf,
      'validity': instance.validity,
    };
