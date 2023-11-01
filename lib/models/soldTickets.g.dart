// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soldTickets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoldTickets _$SoldTicketsFromJson(Map<String, dynamic> json) => SoldTickets(
      soldTickets: json['soldTickets'] as int,
      totalTickets: json['totalTickets'] as int,
    );

Map<String, dynamic> _$SoldTicketsToJson(SoldTickets instance) =>
    <String, dynamic>{
      'totalTickets': instance.totalTickets,
      'soldTickets': instance.soldTickets,
    };
