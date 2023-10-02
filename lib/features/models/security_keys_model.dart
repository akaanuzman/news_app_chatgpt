import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../products/base/base_model.dart';

part 'security_keys_model.g.dart';

@JsonSerializable()
@immutable
final class SecurityKeysModel extends Equatable
    implements BaseModel<SecurityKeysModel> {
  final String? clientId;
  final String? newsApiKey;

  const SecurityKeysModel({
    this.clientId,
    this.newsApiKey,
  });

  @override
  SecurityKeysModel fromJson(Map<String, dynamic> json) =>
      _$SecurityKeysModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SecurityKeysModelToJson(this);

  @override
  List<Object?> get props => [
        clientId,
        newsApiKey,
      ];

  SecurityKeysModel copyWith({
    String? clientId,
    String? newsApiKey,
  }) {
    return SecurityKeysModel(
      clientId: clientId ?? this.clientId,
      newsApiKey: newsApiKey ?? this.newsApiKey,
    );
  }
}
