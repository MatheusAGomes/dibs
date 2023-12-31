import 'package:dibs/models/events.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:json_annotation/json_annotation.dart';
part 'batchInput.g.dart';

@JsonSerializable()
class BatchInput {
  String name;
  String eventId;
  Events? event;
  String? id;
  int numberOfTickets;
  double announcedPrice;
  IdName? nextBatch;
  BatchStatus status;

  BatchInput({
    this.id,
    required this.name,
    required this.eventId,
    this.event,
    required this.announcedPrice,
    this.nextBatch,
    required this.numberOfTickets,
    required this.status,
  });

  factory BatchInput.fromJson(Map<String, dynamic> json) =>
      _$BatchInputFromJson(json);

  Map<String, dynamic> toJson() => _$BatchInputToJson(this);
}
