// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      number: json['number'] as String,
      cpf: json['cpf'] as String,
      name: json['name'] as String,
      validity: json['validity'] as String,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'cpf': instance.cpf,
      'validity': instance.validity,
    };
