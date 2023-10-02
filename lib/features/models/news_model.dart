import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../products/base/base_model.dart';

part 'news_model.g.dart';

@JsonSerializable()
@immutable
final class NewsModel extends Equatable implements BaseModel<NewsModel> {
  final String? title;
  final String? description;
  final String? content;
  final String? image;
  final String? publishedAt;

  const NewsModel({
    this.title,
    this.description,
    this.content,
    this.image,
    this.publishedAt,
  });

  @override
  NewsModel fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  @override
  List<Object?> get props => [
        title,
        description,
        content,
        image,
        publishedAt,
      ];

  NewsModel copyWith({
    String? title,
    String? description,
    String? content,
    String? image,
    String? publishedAt,
  }) {
    return NewsModel(
      title: title ?? this.title,
      description: description ?? this.description,
      content: content ?? this.content,
      image: image ?? this.image,
      publishedAt: publishedAt ?? this.publishedAt,
    );
  }
}
