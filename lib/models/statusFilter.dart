import 'package:json_annotation/json_annotation.dart';

part 'statusFilter.g.dart';

@JsonSerializable()
class StatusFilter {
  String status;

  StatusFilter({required this.status});

  factory StatusFilter.fromJson(Map<String, dynamic> json) =>
      _$StatusFilterFromJson(json);

  Map<String, dynamic> toJson() => _$StatusFilterToJson(this);
}
