// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resumoDaCompraString.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResumoDaCompraString _$ResumoDaCompraStringFromJson(
        Map<String, dynamic> json) =>
    ResumoDaCompraString(
      name: json['name'] as String,
      tipo: json['tipo'] as String,
      preco: (json['preco'] as num).toDouble(),
    );

Map<String, dynamic> _$ResumoDaCompraStringToJson(
        ResumoDaCompraString instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tipo': instance.tipo,
      'preco': instance.preco,
    };
