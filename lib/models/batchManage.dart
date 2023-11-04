import 'package:dibs/models/events.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:json_annotation/json_annotation.dart';
part 'batchManage.g.dart';

@JsonSerializable()
class BatchManage {
  String id;
  String name;
  double announcedPrice;
  int numberOfFullPriceTickets;
  int numberOfHalfPriceTickets;
  bool hasFullPriceTickets;
  bool hasHalfPriceTickets;

  BatchStatus status;

  BatchManage({
    required this.id,
    required this.name,
    required this.announcedPrice,
    required this.numberOfFullPriceTickets,
    required this.hasFullPriceTickets,
    required this.numberOfHalfPriceTickets,
    required this.hasHalfPriceTickets,
    required this.status,
  });

  factory BatchManage.fromJson(Map<String, dynamic> json) =>
      _$BatchManageFromJson(json);

  Map<String, dynamic> toJson() => _$BatchManageToJson(this);
}
