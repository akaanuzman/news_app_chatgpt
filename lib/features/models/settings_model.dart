import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../products/base/base_firebase_model.dart';

part 'settings_model.g.dart';

@JsonSerializable()
@immutable
final class SettingsModel extends Equatable
    implements BaseFirebaseModel<SettingsModel> {
  final String? appleShaKey;
  final String? clientId;

  const SettingsModel({
    this.appleShaKey,
    this.clientId,
  });

  @override
  SettingsModel fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SettingsModelToJson(this);

  @override
  List<Object?> get props => [
        appleShaKey,
        clientId,
      ];

  SettingsModel copyWith({
    String? appleShaKey,
    String? clientId,
  }) {
    return SettingsModel(
      appleShaKey: appleShaKey ?? this.appleShaKey,
      clientId: clientId ?? this.clientId,
    );
  }
}
