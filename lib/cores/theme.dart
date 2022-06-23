import 'package:flutter/material.dart';
import 'dart:ui' as ui show Shadow, FontFeature;

import 'app_modules/hex_color.dart';


@immutable
class MyTextStyle extends TextStyle {
  MyTextStyle bold() {
    return copyWith1(fontWeight: FontWeight.w700);
  }

  MyTextStyle italic() {
    return copyWith1(fontStyle: FontStyle.italic);
  }

  MyTextStyle medium() {
    return copyWith1(fontWeight: FontWeight.w500);
  }

  MyTextStyle setHeight({double height = 0.8}) {
    return copyWith1(
      height: height,
    );
  }

  MyTextStyle copyWith1({
    bool? inherit,
    Color? color,
    Color? backgroundColor,
    String? fontFamily,
    List<String>? fontFamilyFallback,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    double? letterSpacing,
    double? wordSpacing,
    TextBaseline? textBaseline,
    double? height,
    Locale? locale,
    Paint? foreground,
    Paint? background,
    List<ui.Shadow>? shadows,
    List<ui.FontFeature>? fontFeatures,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    String? debugLabel,
  }) {
    assert(color == null || foreground == null);
    assert(backgroundColor == null || background == null);
    String? newDebugLabel;
    assert(() {
      if (this.debugLabel != null)
        newDebugLabel = debugLabel ?? '(${this.debugLabel}).copyWith1';
      return true;
    }());
    return MyTextStyle(
      inherit: inherit ?? this.inherit,
      color: this.foreground == null && foreground == null
          ? color ?? this.color
          : null,
      backgroundColor: this.background == null && background == null
          ? backgroundColor ?? this.backgroundColor
          : null,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFamilyFallback: fontFamilyFallback ?? this.fontFamilyFallback,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      wordSpacing: wordSpacing ?? this.wordSpacing,
      textBaseline: textBaseline ?? this.textBaseline,
      height: height ?? this.height,
      locale: locale ?? this.locale,
      foreground: foreground ?? this.foreground,
      background: background ?? this.background,
      shadows: shadows ?? this.shadows,
      fontFeatures: fontFeatures ?? this.fontFeatures,
      decoration: decoration ?? this.decoration,
      decorationColor: decorationColor ?? this.decorationColor,
      decorationStyle: decorationStyle ?? this.decorationStyle,
      decorationThickness: decorationThickness ?? this.decorationThickness,
      debugLabel: newDebugLabel,
    );
  }

  MyTextStyle({
    inherit = true,
    fontSize,
    color,
    fontWeight,
    backgroundColor,
    fontFamily,
    fontFamilyFallback,
    fontStyle,
    letterSpacing,
    wordSpacing,
    textBaseline,
    height,
    locale,
    foreground,
    background,
    shadows,
    fontFeatures,
    decoration,
    decorationColor,
    decorationStyle,
    decorationThickness,
    debugLabel,
  }) : super(
          inherit: inherit,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          backgroundColor: backgroundColor,
          fontFamily: fontFamily,
          fontFamilyFallback: fontFamilyFallback,
          fontStyle: fontStyle,
          letterSpacing: letterSpacing,
          wordSpacing: wordSpacing,
          textBaseline: textBaseline,
          height: height,
          locale: locale,
          foreground: foreground,
          background: background,
          shadows: shadows,
          fontFeatures: fontFeatures,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          decorationThickness: decorationThickness,
          debugLabel: debugLabel,
        );
}

class AppTheme {
  AppTheme._();

  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color tileBorderColor = Color(0xFFF4F5F6);
  static final Color blue = HexColor('#0B7EFB');
  static final Color backgroundColor = HexColor('#F4F5F6');
  static final double fontSizeText = 16;
  static final Color colorRed = HexColor('#DD005D');
  static final Color borderLineColor = HexColor('#DBE0E6');
  static final Color colorRedWhite = HexColor('#FCE6EF');

  static final ButtonStyle roundOulineButtonPrimary = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide.none,
      ),
    ),
    padding: MaterialStateProperty.all(
      EdgeInsets.all(15),
    ),
    backgroundColor: MaterialStateProperty.all(AppTheme.colorRed),
  );

  static final ButtonStyle roundUnactiveButton = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    padding: MaterialStateProperty.all(
      EdgeInsets.all(15),
    ),
    backgroundColor: MaterialStateProperty.all(backgroundColor),
  );

  static final ButtonStyle roundOulineButton = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: AppTheme.borderLineColor),
      ),
    ),
    padding: MaterialStateProperty.all(
      EdgeInsets.all(15),
    ),
    backgroundColor: MaterialStateProperty.all(AppTheme.colorRedWhite),
  );
}
