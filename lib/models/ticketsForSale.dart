import 'dart:ffi';
import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

import 'ticketInfoInput.dart';

part 'ticketsForSale.g.dart';

@JsonSerializable()
class TicketForSale {
  String id;
  String name;
  String sellerId;
  double resalePrice;
  String seller;
  String eventId;
  String event;
  bool halfPrice;
  int numberOfTickets;
  bool valid;
  bool forSale;
  TicketForSale({
    required this.resalePrice,
    required this.id,
    required this.name,
    required this.sellerId,
    required this.seller,
    required this.eventId,
    required this.event,
    required this.halfPrice,
    required this.numberOfTickets,
    required this.valid,
    required this.forSale,
  });

  factory TicketForSale.fromJson(Map<String, dynamic> json) =>
      _$TicketForSaleFromJson(json);

  Map<String, dynamic> toJson() => _$TicketForSaleToJson(this);
}
