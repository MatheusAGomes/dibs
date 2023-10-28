// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticketClient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketClient _$TicketClientFromJson(Map<String, dynamic> json) => TicketClient(
      clientId: json['clientId'] as String,
      eventId: json['eventId'] as String,
      ticketInfo: (json['ticketInfo'] as List<dynamic>)
          .map((e) => TicketClientInfoInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketClientToJson(TicketClient instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'eventId': instance.eventId,
      'ticketInfo': instance.ticketInfo,
    };
