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
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? Colors.black,
    );
  }

  TextStyle tiny(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 10,
      fontFamily: 'Appfont-Medium',
      fontWeight: fontWeight ?? FontWeight.w400,
      color: Colors.grey,
    );
  }

  TextStyle normal(BuildContext ctx, {Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontSize: 14,
      fontFamily: 'Appfont-Medium',
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color ?? Colors.grey,
    );
  }
}
