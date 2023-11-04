import 'package:json_annotation/json_annotation.dart';

import '../shared/enum/EventStatus.dart';

part 'gambEditar.g.dart';

@JsonSerializable()
class GambEditar {
  String? id;

  GambEditar({
    this.id,
  });

  factory GambEditar.fromJson(Map<String, dynamic> json) =>
      _$GambEditarFromJson(json);

  Map<String, dynamic> toJson() => _$GambEditarToJson(this);
}
