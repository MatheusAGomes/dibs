import 'package:json_annotation/json_annotation.dart';


part 'eventsClient.g.dart';

@JsonSerializable()
class EventsClient {
  String picture;
  String startDate;
  String time;
  String name;
  String address;
  String description;
  String category;
  String status;

  EventsClient({
    required this.status,
    required this.startDate,
    required this.time,
    required this.name,
    required this.address,
    required this.description,
    required this.category,
    required this.picture,
  });

  factory EventsClient.fromJson(Map<String, dynamic> json) =>
      _$EventsClientFromJson(json);

  Map<String, dynamic> toJson() => _$EventsClientToJson(this);
}
