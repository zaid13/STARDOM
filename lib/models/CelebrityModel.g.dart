// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CelebrityModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CelebrityModel _$CelebrityModelFromJson(Map<String, dynamic> json) => CelebrityModel(
      uid: json['uid'] as String,
      picture_url: json['picture_url'] as String,
      phone_number: json['phone_number'] as String,
      email_address: json['email_address'] as String,

      user_name: json['user_name'] as String,
      balance: json['balance'] as double,


    category: json['category']  as List,
    messageCategoryCharges: json['messageCategoryCharges'] as double,
    videoCategoryCharges: json['videoCategoryCharges'] as double,
    isActive: json['isActive'] as bool,

    );

Map<String, dynamic> _$CelebrityModelToJson(CelebrityModel instance) => <String, dynamic>{
      'picture_url': instance.picture_url,
      'phone_number': instance.phone_number,
      'email_address': instance.email_address,
      'balance':instance.balance,
      'uid': instance.uid,
      'user_name': instance.user_name,

  'category':instance.category,
  'messageCategoryCharges':instance.messageCategoryCharges,
  'videoCategoryCharges':instance.videoCategoryCharges,
  'isActive':instance.isActive,


    };
