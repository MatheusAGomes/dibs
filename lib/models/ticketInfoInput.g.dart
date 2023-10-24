// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticketInfoInput.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketInfoInput _$TicketInfoInputFromJson(Map<String, dynamic> json) =>
    TicketInfoInput(
      name: json['name'] as String,
      cpf: json['cpf'] as String,
      halfPrice: json['halfPrice'] as bool,
      isOwner: json['isOwner'] as bool,
    );

Map<String, dynamic> _$TicketInfoInputToJson(TicketInfoInput instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cpf': instance.cpf,
      'isOwner': instance.isOwner,
      'halfPrice': instance.halfPrice,
    };
