// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticketsForSale.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketForSale _$TicketForSaleFromJson(Map<String, dynamic> json) =>
    TicketForSale(
      resalePrice: (json['resalePrice'] as num).toDouble(),
      id: json['id'] as String,
      name: json['name'] as String,
      sellerId: json['sellerId'] as String,
      seller: json['seller'] as String,
      eventId: json['eventId'] as String,
      event: json['event'] as String,
      halfPrice: json['halfPrice'] as bool,
      numberOfTickets: json['numberOfTickets'] as int,
      valid: json['valid'] as bool,
      forSale: json['forSale'] as bool,
    );

Map<String, dynamic> _$TicketForSaleToJson(TicketForSale instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sellerId': instance.sellerId,
      'resalePrice': instance.resalePrice,
      'seller': instance.seller,
      'eventId': instance.eventId,
      'event': instance.event,
      'halfPrice': instance.halfPrice,
      'numberOfTickets': instance.numberOfTickets,
      'valid': instance.valid,
      'forSale': instance.forSale,
    };
