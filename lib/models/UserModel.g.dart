// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      picture_url: json['picture_url'] as String,
      phone_number: json['phone_number'] as String,
      email_address: json['email_address'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'picture_url': instance.picture_url,
      'phone_number': instance.phone_number,
      'email_address': instance.email_address,
      'password': instance.password,
    };
