import 'package:dibs/models/events.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:json_annotation/json_annotation.dart';
part 'batchOutput.g.dart';

@JsonSerializable()
class BatchOutput {
  String name;
  int numberOfTickets;
  double announcedPrice;
  IdName? nextBatch;
  BatchStatus status;

  BatchOutput({
    required this.name,
    required this.announcedPrice,
    this.nextBatch,
    required this.numberOfTickets,
    required this.status,
  });

  factory BatchOutput.fromJson(Map<String, dynamic> json) =>
      _$BatchOutputFromJson(json);

  Map<String, dynamic> toJson() => _$BatchOutputToJson(this);
}
