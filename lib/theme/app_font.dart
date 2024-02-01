import 'package:flutter/material.dart';

class FontThemeClass {
  TextStyle appBarText(BuildContext ctx,
      {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 16,
      fontFamily: 'Appfont-Medium',
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  TextStyle medium(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 14.8,
      fontFamily: 'Appfont-Medium',
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  TextStyle regular(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 18,
      fontFamily: 'Appfont-Medium',
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.black,
    );
  }

  TextStyle small(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 12,
      fontFamily: 'Appfont-Medium',
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.black,
    );
  }
  TextStyle italicSmall(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontStyle: FontStyle.italic,
      fontSize: 12,
      fontFamily: 'Appfont-Medium',
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.black,
    );
  }
}
