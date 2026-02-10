import 'package:flutter/material.dart';

import '../../app/generalImports.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.fontSize,
    this.textAlign,
    this.maxLines,
    this.height,
    this.letterSpacing,
    this.showUnderline,
    this.showLineThrough,
    this.decorationColor,
    this.underlineOrLineColor,
  });

  final String text;

  // Text style
  final Color? color;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? fontSize;
  final double? height;
  final double? letterSpacing;

  // Layout
  final TextAlign? textAlign;
  final int? maxLines;

  // Decorations
  final bool? showUnderline;
  final bool? showLineThrough;
  final Color? decorationColor;
  final Color? underlineOrLineColor;

  TextStyle _textStyle(BuildContext context) {
    return TextStyle(
      color: color ?? Theme.of(context).colorScheme.onSurface,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: fontStyle,
      fontSize: fontSize ?? 14,
      height: height ?? 1.4,
      letterSpacing: letterSpacing,
      decoration: _decoration,
      decorationColor: decorationColor,
    );
  }

  TextDecoration? get _decoration {
    if (showLineThrough == true) {
      return TextDecoration.lineThrough;
    }
    if (showUnderline == true) {
      return TextDecoration.underline;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      softWrap: true,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
      textAlign: textAlign,
      textScaler: TextScaler.noScaling,
      style: _textStyle(context),
    );
  }
}
