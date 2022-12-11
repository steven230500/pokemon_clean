import 'package:flutter/material.dart';
import 'package:test_pokemon/app/ui/colors.dart';
import 'package:test_pokemon/app/ui/typography.dart';

class PockeText {
  PockeText._();

  ///h1 Text widget - fontSize 32
  static Widget h1({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    double? letterSpacing,
    int? maxLines,
  }) =>
      _TextGeneric(
        label: label,
        fontSize: PocketTypography.h1,
        color: color ?? PockeColors.black,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
      );

  ///body Text widget - fontSize 16
  static Widget body({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
  }) =>
      _TextGeneric(
        label: label,
        fontSize: PocketTypography.body,
        color: color ?? PockeColors.black,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
      );

  ///labelText Text widget - fontSize 14
  static Widget labelText({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
  }) =>
      _TextGeneric(
        label: label,
        fontSize: PocketTypography.label,
        color: color ?? PockeColors.black,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
      );

  ///small Text widget - fontSize 12
  static Widget small({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
  }) =>
      _TextGeneric(
        label: label,
        fontSize: PocketTypography.small,
        color: color ?? PockeColors.black,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
      );

  ///very small Text widget - fontSize 8
  static Widget xsmall({
    required String label,
    Key? key,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    Color? color,
    TextOverflow? textOverflow,
    int? maxLines,
    double? letterSpacing,
  }) =>
      _TextGeneric(
        label: label,
        fontSize: PocketTypography.xSmall,
        color: color ?? PockeColors.black,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        textAlign: textAlign,
        textOverflow: textOverflow,
        letterSpacing: letterSpacing,
      );

  static TextStyle style({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
  }) =>
      TextStyle(
        fontFamily: PocketTypography.segoe,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        letterSpacing: letterSpacing,
      );
}

class _TextGeneric extends StatelessWidget {
  const _TextGeneric({
    required this.label,
    required this.fontSize,
    this.color,
    this.fontStyle,
    this.fontWeight,
    this.textOverflow,
    this.textAlign,
    this.letterSpacing,
  }) : super();

  final String label;
  final double fontSize;
  final TextOverflow? textOverflow;
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: textAlign,
      style: PockeText.style(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        letterSpacing: letterSpacing,
      ),
      overflow: textOverflow,
    );
  }
}
