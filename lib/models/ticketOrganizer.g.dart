// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticketOrganizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOrganizer _$TicketOrganizerFromJson(Map<String, dynamic> json) =>
    TicketOrganizer(
      ticketBatch: (json['ticketBatch'] as List<dynamic>)
          .map((e) => TicketLote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketOrganizerToJson(TicketOrganizer instance) =>
    <String, dynamic>{
      'ticketBatch': instance.ticketBatch,
    };
