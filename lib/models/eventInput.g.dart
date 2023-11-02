// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventInput.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventInput _$EventInputFromJson(Map<String, dynamic> json) => EventInput(
      address: Endereco.fromJson(json['address'] as Map<String, dynamic>),
      description: json['description'] as String,
      name: json['name'] as String,
      picture: json['picture'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      category: $enumDecode(_$EventCategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$EventInputToJson(EventInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'picture': instance.picture,
      'startDate': instance.startDate.toIso8601String(),
      'description': instance.description,
      'address': instance.address,
      'category': _$EventCategoryEnumMap[instance.category]!,
    };

const _$EventCategoryEnumMap = {
  EventCategory.SHOW: 'SHOW',
  EventCategory.TEATRO: 'TEATRO',
  EventCategory.CORRIDA: 'CORRIDA',
  EventCategory.FESTA: 'FESTA',
  EventCategory.RELIGIOSO: 'RELIGIOSO',
};
