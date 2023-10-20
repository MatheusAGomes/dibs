// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lote _$LoteFromJson(Map<String, dynamic> json) => Lote(
      name: json['name'] as String,
      announcedPrice: (json['announcedPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$LoteToJson(Lote instance) => <String, dynamic>{
      'name': instance.name,
      'announcedPrice': instance.announcedPrice,
    };
