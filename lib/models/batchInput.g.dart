// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batchInput.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchInput _$BatchInputFromJson(Map<String, dynamic> json) => BatchInput(
      id: json['id'] as String?,
      name: json['name'] as String,
      eventId: json['eventId'] as String,
      event: json['event'] == null
          ? null
          : Events.fromJson(json['event'] as Map<String, dynamic>),
      announcedPrice: (json['announcedPrice'] as num).toDouble(),
      nextBatch: json['nextBatch'] == null
          ? null
          : IdName.fromJson(json['nextBatch'] as Map<String, dynamic>),
      numberOfTickets: json['numberOfTickets'] as int,
      status: $enumDecode(_$BatchStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$BatchInputToJson(BatchInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'eventId': instance.eventId,
      'event': instance.event,
      'id': instance.id,
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
