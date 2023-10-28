// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticketClientInfoInput.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketClientInfoInput _$TicketClientInfoInputFromJson(
        Map<String, dynamic> json) =>
    TicketClientInfoInput(
      batchId: json['batchId'] as String,
      name: json['name'] as String,
      cpf: json['cpf'] as String,
      halfPrice: json['halfPrice'] as bool,
      isOwner: json['isOwner'] as bool,
    );

Map<String, dynamic> _$TicketClientInfoInputToJson(
        TicketClientInfoInput instance) =>
    <String, dynamic>{
      'batchId': instance.batchId,
      'name': instance.name,
      'cpf': instance.cpf,
      'isOwner': instance.isOwner,
      'halfPrice': instance.halfPrice,
    };
