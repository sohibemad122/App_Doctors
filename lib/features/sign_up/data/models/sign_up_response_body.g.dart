// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseBody _$SignUpResponseBodyFromJson(Map<String, dynamic> json) =>
    SignUpResponseBody(
      message: json['message'] as String?,
      userDate: json['data'] == null
          ? null
          : UserDate.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as bool?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SignUpResponseBodyToJson(SignUpResponseBody instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.userDate,
      'status': instance.status,
      'code': instance.code,
    };

UserDate _$UserDateFromJson(Map<String, dynamic> json) => UserDate(
  token: json['token'] as String?,
  userName: json['username'] as String?,
);

Map<String, dynamic> _$UserDateToJson(UserDate instance) => <String, dynamic>{
  'token': instance.token,
  'username': instance.userName,
};
