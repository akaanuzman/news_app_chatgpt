// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_keys_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SecurityKeysModel _$SecurityKeysModelFromJson(Map<String, dynamic> json) =>
    SecurityKeysModel(
      clientId: json['clientId'] as String?,
      newsApiKey: json['newsApiKey'] as String?,
    );

Map<String, dynamic> _$SecurityKeysModelToJson(SecurityKeysModel instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'newsApiKey': instance.newsApiKey,
    };
