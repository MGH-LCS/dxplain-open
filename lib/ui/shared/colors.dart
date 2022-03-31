//  Copyright © 2020 MGH Lab of Computer Science. All rights reserved.
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Color? dxplainOpenColor = CupertinoColors.systemGreen.color;

Color? dangerColor = Colors.red[600];

Color? defaultButtonColor = Colors.grey[500];

UIColor divDividerColor = UIColor(light: Colors.grey[400], dark: Colors.grey[300]);
UIColor menuIconColor = UIColor(light: CupertinoColors.systemGreen.color, dark: Colors.green[300]);

//  Class Definitions  //
class UIColor {
  final Color? light;
  final Color? dark;
  UIColor({required this.light, required this.dark});
}

class UITextStyle {
  final TextStyle? light;
  final TextStyle? dark;
  UITextStyle({required this.light, required this.dark});
}

class UIDecoration {
  final Decoration? light;
  final Decoration? dark;
  UIDecoration({required this.light, required this.dark});
}

class UIBoxDecoration {
  final BoxDecoration? light;
  final BoxDecoration? dark;
  UIBoxDecoration({required this.light, required this.dark});
}

class UIImage {
  final AssetImage? light;
  final AssetImage? dark;
  UIImage({required this.light, required this.dark});
}

class UILinearGradient {
  final LinearGradient? light;
  final LinearGradient? dark;
  UILinearGradient({required this.light, required this.dark});
}

UIBoxDecoration sortDropdownButtonDecoration = UIBoxDecoration(
  light: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
    border: new Border.all(color: Colors.grey[200]!),
    color: Colors.grey[200],
  ),
  dark: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
    border: new Border.all(color: Colors.black38),
    color: Colors.grey[800],
  ),
);
