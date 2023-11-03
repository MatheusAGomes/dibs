// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batchManage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchManage _$BatchManageFromJson(Map<String, dynamic> json) => BatchManage(
      id: json['id'] as String,
      name: json['name'] as String,
      announcedPrice: (json['announcedPrice'] as num).toDouble(),
      numberOfFullPriceTickets: json['numberOfFullPriceTickets'] as int,
      hasFullPriceTickets: json['hasFullPriceTickets'] as bool,
      numberOfHalfPriceTickets: json['numberOfHalfPriceTickets'] as int,
      hasHalfPriceTickets: json['hasHalfPriceTickets'] as bool,
      status: $enumDecode(_$BatchStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$BatchManageToJson(BatchManage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'announcedPrice': instance.announcedPrice,
      'numberOfFullPriceTickets': instance.numberOfFullPriceTickets,
      'numberOfHalfPriceTickets': instance.numberOfHalfPriceTickets,
      'hasFullPriceTickets': instance.hasFullPriceTickets,
      'hasHalfPriceTickets': instance.hasHalfPriceTickets,
      'status': _$BatchStatusEnumMap[instance.status]!,
    };

const _$BatchStatusEnumMap = {
  BatchStatus.PUBLISHED: 'PUBLISHED',
  BatchStatus.CREATED: 'CREATED',
  BatchStatus.FINISHED: 'FINISHED',
};
