// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticketOutput.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketOutput _$TicketOutputFromJson(Map<String, dynamic> json) => TicketOutput(
      id: json['id'] as String,
      picture: json['picture'] as String,
      eventName: json['eventName'] as String,
      address: json['address'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      name: json['name'] as String,
      cpf: json['cpf'] as String,
      batchName: json['batchName'] as String,
      qrCode: json['qrCode'] as String,
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      valid: json['valid'] as bool,
      halfPrice: json['halfPrice'] as bool,
    );

Map<String, dynamic> _$TicketOutputToJson(TicketOutput instance) =>
    <String, dynamic>{
      'id': instance.id,
      'picture': instance.picture,
      'eventName': instance.eventName,
      'address': instance.address,
      'date': instance.date,
      'time': instance.time,
      'name': instance.name,
      'cpf': instance.cpf,
      'batchName': instance.batchName,
      'qrCode': instance.qrCode,
      'purchasePrice': instance.purchasePrice,
      'valid': instance.valid,
      'halfPrice': instance.halfPrice,
    };
