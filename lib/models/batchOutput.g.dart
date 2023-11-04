// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batchOutput.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchOutput _$BatchOutputFromJson(Map<String, dynamic> json) => BatchOutput(
      name: json['name'] as String,
      announcedPrice: (json['announcedPrice'] as num).toDouble(),
      nextBatch: json['nextBatch'] == null
          ? null
          : IdName.fromJson(json['nextBatch'] as Map<String, dynamic>),
      numberOfTickets: json['numberOfTickets'] as int,
      status: $enumDecode(_$BatchStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$BatchOutputToJson(BatchOutput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'numberOfTickets': instance.numberOfTickets,
      'announcedPrice': instance.announcedPrice,
      'nextBatch': instance.nextBatch,
      'status': _$BatchStatusEnumMap[instance.status]!,
    };

const _$BatchStatusEnumMap = {
  BatchStatus.PUBLISHED: 'PUBLISHED',
  BatchStatus.CREATED: 'CREATED',
  BatchStatus.FINISHED: 'FINISHED',
};
