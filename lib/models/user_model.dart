import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel? userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel? data) => json.encode(data!.toJson());

class UserModel {
  UserModel({
    this.userId,
    this.fcmToken,
    this.username,
    this.email,
    this.password,
  });

  String? userId;
  String? fcmToken;
  String? username;
  String? email;
  String? password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        fcmToken: json["fcm_token"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );
  factory UserModel.fromFirebaseSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      UserModel(
        userId: json["user_id"],
        fcmToken: json["fcm_token"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fcm_token": fcmToken,
        "username": username,
        "email": email,
        "password": password,
      };
}
