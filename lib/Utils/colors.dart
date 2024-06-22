import 'package:flutter/material.dart';
import 'dart:math';

class AppColor {
  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}

class Palette {
  ///----------------------------------------------///
  static const Color main = Color(0xff964242);
  static const Color mainLight = Color(0xffcc7d7d);
  static const Color grad1yellow = Color(0xffd7d18d);
  static const Color grad2yellow = Color(0xffb7b33e);

  static const Color grad1green = Color(0xffa6d78d);
  static const Color grad2green = Color(0xff84be55);

  static const Color grad1blue = Color(0xff8dd7c3);
  static const Color grad2blue = Color(0xff55beb2);

  static const Color maindark = Color(0xff964242);
  static const Color background = Color(0xffffe8e8);
  static const Color container = Color(0xffefefef);
  static const Color text = Color(0xff000000);
  static const Color textdisc = Color(0xff4b4b4b);
  static const Color textwhite = Color(0xffffffff);
  static const Color shadow = Color(0xc0676767);
  static const Color answered = Color(0xffd2ff96);
  static const Color visited = Color(0xffeae89c);
  static const Color containertranse = Color(0x9dffffff);
  ///----------------------------------------------///

  static const Color textd = Color(0xff343434);
  static const Color sucess = Color(0xff819f51);
  static const Color failed = Color(0xffb75252);
  static const Color textl = Color(0xff626262);
  static const Color border = Color(0xffffffff);
  static const Color bgd = Color(0xff3b3b3b);
  static const Color bgl = Color(0xffa6bec5);
  static const Color lightbg = Color(0xff32d7c7);
  static const Color l1 = Color(0xff964242);
  static const Color restrict = Color(0xffff5237);
  static const Color allow = Color(0xffb7d728);
  static const Color l4 = Color(0xff429676);
  static const Color l5 = Color(0xff427396);
  static const Color l6 = Color(0xff8058b0);
  static const Color l7 = Color(0xff74249d);
  static const Color l8 = Color(0xff988576);
  static const Color mainthf = Color(0xc0b64e0d);
  static const Color alert = Color(0xfffd0202);
  static const Color infomsg = Color(0xc0b64e0d);
}