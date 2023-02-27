// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

CategoryModel? categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel? data) => json.encode(data!.toJson());

class CategoryModel {
  CategoryModel({
    this.id,
    this.categoryName,
  });

  String? id;
  String? categoryName;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    categoryName: json["categoryName"],
  );

  factory CategoryModel.fromFirebaseSnapshot(DocumentSnapshot<Map<String, dynamic>> json) => CategoryModel(
    id: json.id,
    categoryName: json["categoryName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryName": categoryName,
  };
}
