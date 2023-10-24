import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'meuIngressoBanner.g.dart';

@JsonSerializable()
class MeuIngressoBanner {
  String id;
  String eventName;
  String eventId;
  String picture;
  String address;
  String startDate;
  String? time;
  bool valid;
  bool forSale;

  MeuIngressoBanner({
    required this.id,
    required this.eventId,
    required this.eventName,
    required this.address,
    required this.picture,
    required this.startDate,
    this.time,
    required this.valid,
    required this.forSale,
  });

  factory MeuIngressoBanner.fromJson(Map<String, dynamic> json) =>
      _$MeuIngressoBannerFromJson(json);

  Map<String, dynamic> toJson() => _$MeuIngressoBannerToJson(this);
}
