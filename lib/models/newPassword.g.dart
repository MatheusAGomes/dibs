// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newPassword.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPassword _$NewPasswordFromJson(Map<String, dynamic> json) => NewPassword(
      currentPassword: json['currentPassword'] as String,
      newPassword: json['newPassword'] as String,
    );

Map<String, dynamic> _$NewPasswordToJson(NewPassword instance) =>
    <String, dynamic>{
      'currentPassword': instance.currentPassword,
      'newPassword': instance.newPassword,
    };
