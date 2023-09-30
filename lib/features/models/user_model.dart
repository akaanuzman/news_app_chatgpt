import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@immutable
final class UserModel with EquatableMixin {
  final String? id;
  final String? name;
  final String? surname;
  final String? fullName;
  final String? email;
  final String? profilePicture;
  final DateTime? createdAt;
  final bool? isActive;

  UserModel({
    this.id,
    this.name,
    this.surname,
    this.fullName,
    this.email,
    this.profilePicture,
    this.createdAt,
    this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        surname,
        fullName,
        email,
        profilePicture,
        createdAt,
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
      surname: surname ?? this.surname,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      createdAt: createdAt ?? this.createdAt,
      isActive: isActive ?? this.isActive,
    );
  }
}
