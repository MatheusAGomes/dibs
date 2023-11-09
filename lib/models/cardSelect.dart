import 'package:json_annotation/json_annotation.dart';

part 'cardSelect.g.dart';

@JsonSerializable()
class CardSelect {
  String id;
  String number;
  String name;

  CardSelect({
    required this.id,
    required this.name,
    required this.number,
  });

  factory CardSelect.fromJson(Map<String, dynamic> json) =>
      _$CardSelectFromJson(json);

  Map<String, dynamic> toJson() => _$CardSelectToJson(this);
}
