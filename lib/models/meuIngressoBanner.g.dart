// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meuIngressoBanner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeuIngressoBanner _$MeuIngressoBannerFromJson(Map<String, dynamic> json) =>
    MeuIngressoBanner(
      id: json['id'] as String,
      eventId: json['eventId'] as String,
      eventName: json['eventName'] as String,
      address: json['address'] as String,
      picture: json['picture'] as String,
      startDate: json['startDate'] as String,
      time: json['time'] as String?,
      valid: json['valid'] as bool,
      forSale: json['forSale'] as bool,
    );

Map<String, dynamic> _$MeuIngressoBannerToJson(MeuIngressoBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventName': instance.eventName,
      'eventId': instance.eventId,
      'picture': instance.picture,
      'address': instance.address,
      'startDate': instance.startDate,
      'time': instance.time,
      'valid': instance.valid,
      'forSale': instance.forSale,
    };
