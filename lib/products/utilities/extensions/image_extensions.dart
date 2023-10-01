import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension ImageExtensions on String {
  AssetImage get assetImage => AssetImage(this);
  Image get image => Image.asset(this);
  SvgPicture get svg => SvgPicture.asset(this);
}
