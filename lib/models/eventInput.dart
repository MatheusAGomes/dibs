import 'package:dibs/models/endereco.dart';
import 'package:dibs/shared/enum/EventStatus.dart';
import 'package:dibs/shared/enum/EvetnCategory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'eventInput.g.dart';

@JsonSerializable()
class EventInput {
  String name;
  String picture;
  DateTime startDate;
  String description;
  Endereco address;
  EventStatusEnum status;
  EventCategory category;
  EventInput(
      {required this.address,
      required this.description,
      required this.status,
      required this.name,
      required this.picture,
      required this.startDate,
      required this.category});

  factory EventInput.fromJson(Map<String, dynamic> json) =>
      _$EventInputFromJson(json);

  Map<String, dynamic> toJson() => _$EventInputToJson(this);
}
