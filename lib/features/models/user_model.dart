import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../products/base/base_firebase_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
@immutable
final class UserModel extends Equatable
    implements BaseFirebaseModel<UserModel> {
  final String? id;
  final String? name;
  final String? email;
  final String? profilePicture;
  final bool? isActive;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.profilePicture,
    this.isActive,
  });

  @override
  UserModel fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        profilePicture,
        isActive,
      ];

  UserModel copyWith({
    String? id,
    String? name,
    String? surname,
    String? fullName,
    String? email,
    String? profilePicture,
    DateTime? createdAt,
    bool? isActive,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      isActive: isActive ?? this.isActive,
    );
  }
}
