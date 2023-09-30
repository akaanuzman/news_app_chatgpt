// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      profilePicture: json['profilePicture'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isActive: json['isActive'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'fullName': instance.fullName,
      'email': instance.email,
      'profilePicture': instance.profilePicture,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isActive': instance.isActive,
    };
