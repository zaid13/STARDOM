

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()

class UserModel{
  UserModel({
      required this.uid,
      required this.picture_url,
      required this.phone_number,
      required this.email_address,
      required this.password,
      required this.user_name


  });

  String picture_url;
  String phone_number;
  String email_address;
  String password;
  String uid;
  String user_name;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}