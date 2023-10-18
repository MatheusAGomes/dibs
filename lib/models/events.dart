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
  EventStatusEnum? status;

  Events({this.id});

  factory Events.fromJson(Map<String, dynamic> json) => _$EventsFromJson(json);

  Map<String, dynamic> toJson() => _$EventsToJson(this);
}
