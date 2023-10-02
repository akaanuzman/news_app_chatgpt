import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../constants/index.dart';
import 'index.dart';

/// [RoundedRectangleNetworkImage] is a [CustomNetworkImage] with [CircleAvatar].
/// [imageSize] is optional default value small.
/// [iconSize] is optional default value small.
/// [containerSize] is optional default value medium.
/// [imageUrl] is required.
///
/// This is a circle network image widget.
/// Small view is given by default.
class RoundedRectangleNetworkImage extends StatelessWidget {
  final String imageUrl;
  final NetworkImageSizeConstants imageSize;
  final IconSizeConstants iconSize;
  final ContainerSizeConstants containerSize;
  const RoundedRectangleNetworkImage({
    super.key,
    required this.imageUrl,
    this.imageSize = NetworkImageSizeConstants.small,
    this.iconSize = IconSizeConstants.small,
    this.containerSize = ContainerSizeConstants.medium,
  });

  @override
  Widget build(BuildContext context) {
    return CustomNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        width: context.sized.dynamicHeight(containerSize.value),
        height: context.sized.dynamicHeight(containerSize.value),
        decoration: BoxDecoration(
          borderRadius: context.border.lowBorderRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      iconSize: iconSize,
      imageSize: imageSize,
    );
  }
}
