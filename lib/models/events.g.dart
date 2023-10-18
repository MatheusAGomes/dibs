// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Events _$EventsFromJson(Map<String, dynamic> json) => Events(
      id: json['id'] as String?,
    )
      ..name = json['name'] as String?
      ..startDate = json['startDate'] as String?
      ..time = json['time'] as String?
      ..picture = json['picture'] as String?
      ..status = $enumDecodeNullable(_$EventStatusEnumEnumMap, json['status']);

Map<String, dynamic> _$EventsToJson(Events instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startDate': instance.startDate,
      'time': instance.time,
      'picture': instance.picture,
      'status': _$EventStatusEnumEnumMap[instance.status],
    };

const _$EventStatusEnumEnumMap = {
  EventStatusEnum.PUBLISHED: 'PUBLISHED',
  EventStatusEnum.CREATED: 'CREATED',
  EventStatusEnum.FINISHED: 'FINISHED',
};
