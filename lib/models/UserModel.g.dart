// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uid: json['uid'] as String,
      picture_url: json['picture_url'] as String,
      phone_number: json['phone_number'] as String,
      email_address: json['email_address'] as String,

      user_name: json['user_name'] as String,
      balance: json['balance'] as double
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'picture_url': instance.picture_url,
      'phone_number': instance.phone_number,
      'email_address': instance.email_address,
      'balance':instance.balance,
      'uid': instance.uid,
      'user_name': instance.user_name,
    };
