import 'package:flutter/material.dart';

import 'comments_model.dart';

class ProductModel {
  final String? id;
  final String? name;
  final String? description;
  final double? price;
  final bool? favorite;
  final double? review;
  final List<String>? images;
  final List<Color>? color;
  final List<CommentsModel>? comments;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.favorite,
    this.review,
    this.images,
    this.color,
    this.comments,
  });

  ProductModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        price = json['price'] as double?,
        favorite = json['favorite'] as bool?,
        review = json['review'] as double?,
        images =
            (json['images'] as List?)?.map((dynamic e) => e as String).toList(),
        color =
            (json['color'] as List?)?.map((dynamic e) => e as Color).toList(),
        comments = (json['comments'] as List?)
            ?.map((dynamic e) => e as CommentsModel)
            .toList();

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'price': price,
        'favorite': favorite,
        'review': review,
        'images': images,
        'color': color,
        'comments': comments,
      };
}
