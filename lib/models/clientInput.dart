import 'package:dibs/models/events.dart';
import 'package:dibs/models/idName.dart';
import 'package:dibs/shared/enum/BatchStatusEnum.dart';
import 'package:json_annotation/json_annotation.dart';
part 'clientInput.g.dart';

@JsonSerializable()
class ClientInput {
  String? firstName;
  String? lastName;
  String? cpf;
  DateTime? birthDate;
  String? phone;

  ClientInput({
    this.firstName,
    this.lastName,
    this.cpf,
    this.birthDate,
    this.phone,
  });

  factory ClientInput.fromJson(Map<String, dynamic> json) =>
      _$ClientInputFromJson(json);

  Map<String, dynamic> toJson() => _$ClientInputToJson(this);
}
