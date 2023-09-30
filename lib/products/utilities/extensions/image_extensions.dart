import 'package:flutter/material.dart';

extension ImageExtensions on String {
  AssetImage get assetImage => AssetImage(this);
}
