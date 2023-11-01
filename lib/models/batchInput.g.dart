// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batchInput.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchInput _$BatchInputFromJson(Map<String, dynamic> json) => BatchInput(
      name: json['name'] as String,
      eventId: json['eventId'] as String,
      event: Events.fromJson(json['event'] as Map<String, dynamic>),
      announcedPrice: (json['announcedPrice'] as num).toDouble(),
      nextBatch: IdName.fromJson(json['nextBatch'] as Map<String, dynamic>),
      numberOfTickets: json['numberOfTickets'] as int,
      status: $enumDecode(_$BatchStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$BatchInputToJson(BatchInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'eventId': instance.eventId,
      'event': instance.event,
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
