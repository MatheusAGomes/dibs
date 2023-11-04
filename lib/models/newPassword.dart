import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'newPassword.g.dart';

@JsonSerializable()
class NewPassword {
  String currentPassword;
  String newPassword;

  NewPassword({required this.currentPassword, required this.newPassword});

  factory NewPassword.fromJson(Map<String, dynamic> json) =>
      _$NewPasswordFromJson(json);

  Map<String, dynamic> toJson() => _$NewPasswordToJson(this);
}
