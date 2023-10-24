import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'lote.g.dart';

@JsonSerializable()
class Lote {
  String id;
  String name;
  double announcedPrice;
  bool hasFullPriceTickets;
  int numberOfFullPriceTickets;
  bool hasHalfPriceTickets;
  int numberOfHalfPriceTickets;

  Lote({
    required this.id,
    required this.name,
    required this.announcedPrice,
    required this.hasFullPriceTickets,
    required this.hasHalfPriceTickets,
    required this.numberOfFullPriceTickets,
    required this.numberOfHalfPriceTickets,
  });

  factory Lote.fromJson(Map<String, dynamic> json) => _$LoteFromJson(json);

  Map<String, dynamic> toJson() => _$LoteToJson(this);
}
