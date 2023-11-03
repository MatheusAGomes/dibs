// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticketReport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketReport _$TicketReportFromJson(Map<String, dynamic> json) => TicketReport(
      eventName: json['eventName'] as String,
      startDate: json['startDate'] as String,
      time: json['time'] as String,
      halfPrice: json['halfPrice'] as bool,
      address: json['address'] as String,
      batchName: json['batchName'] as String,
      batchPrice: (json['batchPrice'] as num).toDouble(),
      transferDate: json['transferDate'] as String,
      transferTime: json['transferTime'] as String,
      transferPrice: json['transferPrice'] as String,
      advertiser: json['advertiser'] as String,
      advertiserEmail: json['advertiserEmail'] as String,
      buyer: json['buyer'] as String,
      buyerEmail: json['buyerEmail'] as String,
    );

Map<String, dynamic> _$TicketReportToJson(TicketReport instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'startDate': instance.startDate,
      'time': instance.time,
      'halfPrice': instance.halfPrice,
      'address': instance.address,
      'batchName': instance.batchName,
      'batchPrice': instance.batchPrice,
      'transferDate': instance.transferDate,
      'transferTime': instance.transferTime,
      'transferPrice': instance.transferPrice,
      'advertiser': instance.advertiser,
      'advertiserEmail': instance.advertiserEmail,
      'buyer': instance.buyer,
      'buyerEmail': instance.buyerEmail,
    };
