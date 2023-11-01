import 'package:dibs/shared/enum/EvetnCategory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'eventInput.g.dart';

@JsonSerializable()
class EventInput {
  String name;
  String picture;
  DateTime startDate;
  String description;
  String address;
  EventCategory category;
  EventInput(
      {required this.address,
      required this.description,
      required this.name,
      required this.picture,
      required this.startDate,
      required this.category});

  factory EventInput.fromJson(Map<String, dynamic> json) =>
      _$EventInputFromJson(json);

  Map<String, dynamic> toJson() => _$EventInputToJson(this);
}
