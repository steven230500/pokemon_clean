import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.icon, {
    this.width,
    this.height,
    this.color,
    this.fit,
    this.alignment = Alignment.center,
    Key? key,
  }) : super(key: key);

  final String icon;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: width,
      height: height,
      color: color,
      fit: fit ?? BoxFit.contain,
      alignment: alignment,
    );
  }
}
