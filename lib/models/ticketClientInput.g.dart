// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticketClientInput.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketClientInput _$TicketClientInputFromJson(Map<String, dynamic> json) =>
    TicketClientInput(
      ticketClients: (json['ticketClients'] as List<dynamic>)
          .map((e) => TicketClient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketClientInputToJson(TicketClientInput instance) =>
    <String, dynamic>{
      'ticketClients': instance.ticketClients,
    };
