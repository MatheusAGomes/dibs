import 'package:dibs/shared/enum/EvetnCategory.dart';
import 'package:json_annotation/json_annotation.dart';

import '../shared/enum/EventStatus.dart';

part 'events.g.dart';

@JsonSerializable()
class Events {
  String? id;
  String? name;
  String? startDate;
  String? time;
  String? picture;
  String? description;
  String? address;
  EventStatusEnum? status;
  EventCategory category;

  Events(
      {required this.id,
      required this.category,
      required this.name,
      required this.description,
      required this.picture,
      required this.startDate,
      required this.status,
      required this.address,
      required this.time});

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  Map<String, dynamic> toJson() => _$EventsToJson(this);
}
