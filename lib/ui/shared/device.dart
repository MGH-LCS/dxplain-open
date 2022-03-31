import 'package:flutter/material.dart';

import 'colors.dart';

class DeviceConfig {
  static MediaQueryData? data;

  static Orientation? orientation;
  static bool? isPortrait;
  static bool? isPhone;

  static double? screenWidth;
  static double? screenHeight;

  //** PROPERTIES FOR SYSTEM BRIGHNTESS MODE (LIGHT/DARK) */
  static Brightness? brightnessValue;

  //** IF THERE IS ONLY ONE COLOR/DECORATOR IN THE OBJECT IT WILL HANDLE IT */

  Orientation getScreenOrientation(context) => MediaQuery.of(context).orientation;
  bool getIsPortrait(context) => MediaQuery.of(context).orientation == Orientation.portrait;
  double getScreenWidth(context) => MediaQuery.of(context).size.width;
  double getScreenHeight(context) => MediaQuery.of(context).size.height;
  double getIsPhone(context) => MediaQuery.of(context).size.width;

  Color? getColor(BuildContext context, UIColor color) => isDark(context) ? color.dark : color.light;
  TextStyle? getTextStyle(BuildContext context, UITextStyle textStyle) => isDark(context) ? textStyle.dark : textStyle.light;

  Decoration? getDecoration(BuildContext context, UIDecoration decoration) =>
      isDark(context) ? decoration.dark : decoration.light;
  BoxDecoration? getBoxDecoration(BuildContext context, UIBoxDecoration decoration) =>
      isDark(context) ? decoration.dark : decoration.light;
  AssetImage? getAssetImage(BuildContext context, UIImage assetImage) => isDark(context) ? assetImage.dark : assetImage.light;
  LinearGradient? getLinearGradient(BuildContext context, UILinearGradient linearGradient) =>
      isDark(context) ? linearGradient.dark : linearGradient.light;

  bool isDark(BuildContext context) => MediaQuery.of(context).platformBrightness == Brightness.dark;

  void init(BuildContext context) {
    data = MediaQuery.of(context);

    orientation = data!.orientation;
    isPortrait = orientation == Orientation.portrait;

    screenWidth = data!.size.width;
    screenHeight = data!.size.height;
    isPhone = screenWidth! < 600;
    //** PROPERTIES FOR SYSTEM BRIGHNTESS MODE (LIGHT/DARK) */
    brightnessValue = MediaQuery.of(context).platformBrightness;
  }
}

class Globals {
  static const double xOffset_Sidebar = -14.0;
  static const Offset SideBarListOffset = (Offset(xOffset_Sidebar, 0));
  static const double xOffset_BottomSheet = -20.0;
  static const Offset BottomSheetListOffset = (Offset(xOffset_Sidebar, 0));
  static const double phoneScreen = 561;
}
