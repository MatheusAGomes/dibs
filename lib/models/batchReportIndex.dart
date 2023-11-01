import 'package:dibs/models/events.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:json_annotation/json_annotation.dart';
part 'batchReportIndex.g.dart';

@JsonSerializable()
class BatchReportIndex {
  String name;
  int numberOfFullPriceTicketsTotal;
  int numberOfFullPriceTickets;
  int numberOfHalfPriceTicketsTotal;
  int numberOfHalfPriceTickets;
  BatchStatus status;

  BatchReportIndex({
    required this.name,
    required this.numberOfFullPriceTickets,
    required this.numberOfFullPriceTicketsTotal,
    required this.numberOfHalfPriceTickets,
    required this.numberOfHalfPriceTicketsTotal,
    required this.status,
  });

  factory BatchReportIndex.fromJson(Map<String, dynamic> json) =>
      _$BatchReportIndexFromJson(json);

  Map<String, dynamic> toJson() => _$BatchReportIndexToJson(this);
}
