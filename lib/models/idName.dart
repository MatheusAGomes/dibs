import 'package:json_annotation/json_annotation.dart';

part 'idName.g.dart';

@JsonSerializable()
class IdName {
  String id;
  String name;

  IdName({
    required this.id,
    required this.name,
  });

  factory IdName.fromJson(Map<String, dynamic> json) => _$IdNameFromJson(json);

  Map<String, dynamic> toJson() => _$IdNameToJson(this);
}
