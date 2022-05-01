

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CelebrityModel.g.dart';

@JsonSerializable()

class CelebrityModel{
  CelebrityModel({
      required this.uid,
      required this.picture_url,
      required this.phone_number,
      required this.email_address,
      // required this.password,
      required this.user_name,
      required this.balance,

      required this.category,
      required this.videoCategoryCharges,
      required this.messageCategoryCharges,
    required this.isActive

  });

  String picture_url;
  String phone_number;
  String email_address;
  // String password;
  String uid;
  String user_name;
  double balance;
  List  category;
  double messageCategoryCharges;
  double videoCategoryCharges;
  bool isActive;


  factory CelebrityModel.fromJson(Map<String, dynamic> json) => _$CelebrityModelFromJson(json);
  Map<String, dynamic> toJson() => _$CelebrityModelToJson(this);
}