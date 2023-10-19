//import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'autenticationResponse.g.dart';

@JsonSerializable()
class AutenticationResponse {
  String token;

  AutenticationResponse({required this.token});

  factory AutenticationResponse.fromJson(Map<String, dynamic> json) =>
      _$AutenticationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AutenticationResponseToJson(this);
}
