// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticketLote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketLote _$TicketLoteFromJson(Map<String, dynamic> json) => TicketLote(
      batchId: json['batchId'] as String,
      ticketInfo: (json['ticketInfo'] as List<dynamic>)
          .map((e) => TicketInfoInput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketLoteToJson(TicketLote instance) =>
    <String, dynamic>{
      'batchId': instance.batchId,
      'ticketInfo': instance.ticketInfo,
    };
