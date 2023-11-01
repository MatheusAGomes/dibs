// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batchReportIndex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchReportIndex _$BatchReportIndexFromJson(Map<String, dynamic> json) =>
    BatchReportIndex(
      name: json['name'] as String,
      numberOfFullPriceTickets: json['numberOfFullPriceTickets'] as int,
      numberOfFullPriceTicketsTotal:
          json['numberOfFullPriceTicketsTotal'] as int,
      numberOfHalfPriceTickets: json['numberOfHalfPriceTickets'] as int,
      numberOfHalfPriceTicketsTotal:
          json['numberOfHalfPriceTicketsTotal'] as int,
      status: $enumDecode(_$BatchStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$BatchReportIndexToJson(BatchReportIndex instance) =>
    <String, dynamic>{
      'name': instance.name,
      'numberOfFullPriceTicketsTotal': instance.numberOfFullPriceTicketsTotal,
      'numberOfFullPriceTickets': instance.numberOfFullPriceTickets,
      'numberOfHalfPriceTicketsTotal': instance.numberOfHalfPriceTicketsTotal,
      'numberOfHalfPriceTickets': instance.numberOfHalfPriceTickets,
      'status': _$BatchStatusEnumMap[instance.status]!,
    };

const _$BatchStatusEnumMap = {
  BatchStatus.PUBLISHED: 'PUBLISHED',
  BatchStatus.CREATED: 'CREATED',
  BatchStatus.FINISHED: 'FINISHED',
};
