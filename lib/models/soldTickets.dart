import 'package:dibs/models/events.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:json_annotation/json_annotation.dart';
part 'soldTickets.g.dart';

@JsonSerializable()
class SoldTickets {
  int totalTickets;
  int soldTickets;

  SoldTickets({
    required this.soldTickets,
    required this.totalTickets,
  });

  factory SoldTickets.fromJson(Map<String, dynamic> json) =>
      _$SoldTicketsFromJson(json);

  Map<String, dynamic> toJson() => _$SoldTicketsToJson(this);
}
