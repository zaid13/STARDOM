

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

@JsonSerializable()

class UserModel{
  UserModel({
    required this.picture_url,
    required this.phone_number,
    required this.email_address,
    required this.password,

  });

  String picture_url;
  String phone_number;
  String email_address;
  String password;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}