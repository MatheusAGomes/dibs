import 'package:dibs/models/events.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:json_annotation/json_annotation.dart';
part 'batchInput.g.dart';

@JsonSerializable()
class BatchInput {
  String name;
  String eventId;
  Events event;

  int numberOfTickets;
  double announcedPrice;
  IdName nextBatch;
  BatchStatus status;

  BatchInput({
    required this.name,
    required this.eventId,
    required this.event,
    required this.announcedPrice,
    required this.nextBatch,
    required this.numberOfTickets,
    required this.status,
  });

  factory BatchInput.fromJson(Map<String, dynamic> json) =>
      _$BatchInputFromJson(json);

  Map<String, dynamic> toJson() => _$BatchInputToJson(this);
}
