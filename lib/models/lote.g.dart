// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lote _$LoteFromJson(Map<String, dynamic> json) => Lote(
      id: json['id'] as String,
      name: json['name'] as String,
      announcedPrice: (json['announcedPrice'] as num).toDouble(),
      hasFullPriceTickets: json['hasFullPriceTickets'] as bool,
      hasHalfPriceTickets: json['hasHalfPriceTickets'] as bool,
      numberOfFullPriceTickets: json['numberOfFullPriceTickets'] as int,
      numberOfHalfPriceTickets: json['numberOfHalfPriceTickets'] as int,
    );

Map<String, dynamic> _$LoteToJson(Lote instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'announcedPrice': instance.announcedPrice,
      'hasFullPriceTickets': instance.hasFullPriceTickets,
      'numberOfFullPriceTickets': instance.numberOfFullPriceTickets,
      'hasHalfPriceTickets': instance.hasHalfPriceTickets,
      'numberOfHalfPriceTickets': instance.numberOfHalfPriceTickets,
    };
