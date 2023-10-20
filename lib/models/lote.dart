import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'lote.g.dart';

@JsonSerializable()
class Lote {
  String name;
  double announcedPrice;

  Lote({required this.name, required this.announcedPrice});

  factory Lote.fromJson(Map<String, dynamic> json) => _$LoteFromJson(json);

  Map<String, dynamic> toJson() => _$LoteToJson(this);
}
