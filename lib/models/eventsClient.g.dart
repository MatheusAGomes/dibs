// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventsClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventsClient _$EventsClientFromJson(Map<String, dynamic> json) => EventsClient(
      id: json['id'] as String,
      status: json['status'] as String,
      startDate: json['startDate'] as String,
      time: json['time'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      picture: json['picture'] as String,
    );

Map<String, dynamic> _$EventsClientToJson(EventsClient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'picture': instance.picture,
      'startDate': instance.startDate,
      'time': instance.time,
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
      'category': instance.category,
      'status': instance.status,
    };
