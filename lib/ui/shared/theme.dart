// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class DXPlainOpenTheme {
  //LIGHT THEME
  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        // backgroundColor: Colors.green[600],
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 1,
      ),
      primarySwatch: Colors.blue,
      brightness: Brightness.light,
      primaryColor: Colors.green[700],
      textTheme: TextTheme(
        overline: TextStyle(fontSize: 14.0, letterSpacing: 0, fontWeight: FontWeight.w500, color: Colors.green[700]),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
      ),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(appBorderRadius)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
      ),
      // outlinedButtonTheme: OutlinedButtonThemeData(
      //   style: ButtonStyle(
      //     backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[400]!),
      //   ),
      // ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey[400]!, width: 1.0),
          borderRadius: BorderRadius.circular(appBorderRadius),
        ),
      ),
    );
  }

  //DARK THEME
  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black54,
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 1,
      ),
      primarySwatch: Colors.blue,
      brightness: Brightness.dark,
      primaryColor: Colors.blue[700],
      textTheme: TextTheme(
        overline: TextStyle(fontSize: 14.0, letterSpacing: 0, fontWeight: FontWeight.w500, color: Colors.green[700]),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
      ),
      scaffoldBackgroundColor: Colors.grey[900],
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(appBorderRadius)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey[100]!, width: 1.0),
          borderRadius: BorderRadius.circular(appBorderRadius),
        ),
      ),
    );
  }
}

// SIZE VARIABLES
double appPadding = 32;
double appBorderRadius = 22.5;

double mobilePadding = 12;
double tabletPadding = 24;
double desktopPadding = 36;

double mobileMaxWidth = DeviceConfig.screenWidth! - mobilePadding;
double tabletMaxWidth = DeviceConfig.screenWidth! - tabletPadding;
double desktopMaxWidth = DeviceConfig.screenWidth! - (desktopPadding * 8);

double cardElevation = 0;

// SIZES FOR THE SYMPTOM BUTTONS THE USER INTERACTS WITH
// Includes both sizes for phones and desktop devices

//MOBILE SIZES
double mobileSymptomButtonWidth = (mobileMaxWidth / 2) - mobilePadding;
double mobileSymptomButtonHeight = 45;
double mobileSymptomButtonSpacing = 8;
double mobileSymptomButtonRunSpacing = 8;
double mobileSymptomButtonTextSize = 14;
double mobileSymptomButtonTextMinSize = 8;
int mobileSymptomTextMaxLines = 3;
double mobileSymptomDefinitionButtonSize = mobileSymptomButtonHeight;

//Tablet Sizes
double tabletSymptomButtonWidth = (tabletMaxWidth / 2) - tabletPadding;
double tabletSymptomButtonHeight = 65;
double tabletSymptomButtonSpacing = 12;
double tabletSymptomButtonRunSpacing = 12;
double tabletSymptomButtonTextSize = 16;
double tabletSymptomButtonTextMinSize = 10;
int tabletSymptomTextMaxLines = 3;
double tabletSymptomDefinitionButtonSize = tabletSymptomButtonHeight;

//DESKTOP SIZES
double desktopSymptomButtonWidth = ((desktopMaxWidth - (desktopPadding / 2)) / 2);
double desktopSymptomButtonHeight = 65;
double desktopSymptomButtonSpacing = 16;
double desktopSymptomButtonRunSpacing = 16;
double desktopSymptomButtonTextSize = 16;
double desktopSymptomButtonTextMinSize = 10;
int desktopSymptomTextMaxLines = 4;
double desktopSymptomDefinitionButtonSize = desktopSymptomButtonHeight;

// SYMPTOM BUTTON THEMES

// COLORS
Color? dxplainOpenColor = CupertinoColors.systemGreen.color;

Color? dangerColor = Colors.red[600];

Color? defaultButtonColor = Colors.grey[500];

ResponsiveTheme appBarIconColor = ResponsiveTheme<Color>(
  light: (context) => CupertinoColors.systemGreen.color,
  dark: (context) => Colors.green[300],
);

ResponsiveTheme symptomButtonTextColor = ResponsiveTheme<Color>(
  light: (context) => Colors.white,
  dark: (context) => Colors.white,
);

ResponsiveTheme symptomButtonDefinitionIconColor = ResponsiveTheme<Color>(
  light: (context) => Colors.white.withOpacity(.5),
  dark: (context) => Colors.white.withOpacity(.5),
);

// **** COLORS AND DECORATIONS FOR THE CASE CARD ************************************************************************** //

// **** SYMPTOM BUTTON STYLES ************************************************************************** //
ResponsiveBreakpoint symptomButtonHeight = ResponsiveBreakpoint(
  phone: (context) => mobileSymptomButtonHeight,
  tablet: (context) => tabletSymptomButtonHeight,
  desktop: (context) => desktopSymptomButtonHeight,
);

ResponsiveBreakpoint symptomButtonWidth = ResponsiveBreakpoint(
  phone: (context) => mobileSymptomButtonWidth,
  tablet: (context) => tabletSymptomButtonWidth,
  desktop: (context) => desktopSymptomButtonWidth,
);

ResponsiveBreakpoint symptomButtonSpacing = ResponsiveBreakpoint(
  phone: (context) => mobileSymptomButtonSpacing,
  tablet: (context) => tabletSymptomButtonSpacing,
  desktop: (context) => desktopSymptomButtonSpacing,
);

ResponsiveBreakpoint symptomButtonRunSpacing = ResponsiveBreakpoint(
  phone: (context) => mobileSymptomButtonRunSpacing,
  tablet: (context) => tabletSymptomButtonRunSpacing,
  desktop: (context) => desktopSymptomButtonRunSpacing,
);

ResponsiveBreakpoint symptomButtonShape = ResponsiveBreakpoint<RoundedRectangleBorder>(
  phone: (context) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(symptomButtonHeight.find(context))),
  tablet: (context) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(symptomButtonHeight.find(context))),
  desktop: (context) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(symptomButtonHeight.find(context))),
);

ResponsiveBreakpoint symptomButtonPadding = ResponsiveBreakpoint<EdgeInsets>(
  phone: (context) => EdgeInsets.all(0),
  tablet: (context) => EdgeInsets.all(0),
  desktop: (context) => EdgeInsets.all(0),
);

// WHEN SYMPTOM BUTTON IS OFF
ResponsiveTheme symptomButtonOff = ResponsiveTheme<ButtonStyle>(
  light: (context) => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
    padding: MaterialStateProperty.all(symptomButtonPadding.find(context)),
    shape: MaterialStateProperty.all(symptomButtonShape.find(context)),
  ),
  dark: (context) => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
    padding: MaterialStateProperty.all(symptomButtonPadding.find(context)),
    shape: MaterialStateProperty.all(symptomButtonShape.find(context)),
  ),
);

// WHEN SYMPTOM BUTTON IS ACTIVE AND SYMPTOM IS PRESENT
ResponsiveTheme symptomButtonPresent = ResponsiveTheme<ButtonStyle>(
  light: (context) => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    padding: MaterialStateProperty.all(symptomButtonPadding.find(context)),
    shape: MaterialStateProperty.all(symptomButtonShape.find(context)),
  ),
  dark: (context) => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    padding: MaterialStateProperty.all(symptomButtonPadding.find(context)),
    shape: MaterialStateProperty.all(symptomButtonShape.find(context)),
  ),
);

// WHEN SYMPTOM BUTTON IS ACTIVE AND SYMPTOM IS ABSENT
ResponsiveTheme symptomButtonAbsent = ResponsiveTheme<ButtonStyle>(
  light: (context) => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[600]!),
    padding: MaterialStateProperty.all(symptomButtonPadding.find(context)),
    shape: MaterialStateProperty.all(symptomButtonShape.find(context)),
  ),
  dark: (context) => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink[600]!),
    padding: MaterialStateProperty.all(symptomButtonPadding.find(context)),
    shape: MaterialStateProperty.all(symptomButtonShape.find(context)),
  ),
);

// SYMPTOM BUTTON TEXT STYLES
ResponsiveBreakpoint symptomButtonTextStyle = ResponsiveBreakpoint<TextStyle>(
  phone: (context) => TextStyle(color: symptomButtonTextColor.find(context), fontSize: mobileSymptomButtonTextSize),
  tablet: (context) => TextStyle(color: symptomButtonTextColor.find(context), fontSize: tabletSymptomButtonTextSize),
  desktop: (context) => TextStyle(color: symptomButtonTextColor.find(context), fontSize: desktopSymptomButtonTextSize),
);

// THE TEXT OF THE SYMPTOM BUTTON IS USING A PACKAGE CALLED AutoSizeText
// THE TEXT SIZE CAN BE REDUCED BASED ON THE LENGTH OF THE SYMPTOM CLINICAL NAME
ResponsiveBreakpoint symptomButtonTextMinSize = ResponsiveBreakpoint(
  phone: (context) => mobileSymptomButtonTextMinSize,
  tablet: (context) => tabletSymptomButtonTextMinSize,
  desktop: (context) => desktopSymptomButtonTextMinSize,
);

ResponsiveBreakpoint symptomButtonTextMaxLines = ResponsiveBreakpoint(
  phone: (context) => mobileSymptomTextMaxLines,
  tablet: (context) => tabletSymptomTextMaxLines,
  desktop: (context) => desktopSymptomTextMaxLines,
);

// THE CONSTRAINTS ON THE LIGHTBULB ICON AT THE RIGHT OF THE SYMPTOM BUTTONS
ResponsiveBreakpoint symptomButtonDefinitionConstraints = ResponsiveBreakpoint<BoxConstraints>(
  phone: (context) => BoxConstraints(
    maxHeight: symptomButtonHeight.find(context),
    maxWidth: symptomButtonHeight.find(context),
    minHeight: symptomButtonHeight.find(context),
    minWidth: symptomButtonHeight.find(context),
  ),
  tablet: (context) => BoxConstraints(
    maxHeight: symptomButtonHeight.find(context),
    maxWidth: symptomButtonHeight.find(context),
    minHeight: symptomButtonHeight.find(context),
    minWidth: symptomButtonHeight.find(context),
  ),
  desktop: (context) => BoxConstraints(
    maxHeight: symptomButtonHeight.find(context),
    maxWidth: symptomButtonHeight.find(context),
    minHeight: symptomButtonHeight.find(context),
    minWidth: symptomButtonHeight.find(context),
  ),
);

// ****  END SYMPTOM BUTTON STYLES ********************************************************************** //

// HOLE CARD DECORATIONS AND THEMES
// HOLE
ResponsiveTheme cardHoleDecoration = ResponsiveTheme<BoxDecoration>(
  light: (context) => BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(appBorderRadius)),
    border: Border.all(color: Colors.green[400]!),
    color: Colors.green[400],
  ),
  dark: (context) => BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(appBorderRadius)),
    border: Border.all(color: Colors.green[400]!),
    color: Colors.green[400],
  ),
);

// PAR
ResponsiveTheme cardParDecoration = ResponsiveTheme<BoxDecoration>(
  light: (context) => BoxDecoration(
    color: Colors.green[600],
  ),
  dark: (context) => BoxDecoration(
    color: Colors.green[600],
  ),
);

//STROKE COUNTER
ResponsiveTheme cardStrokeDecoration = ResponsiveTheme<BoxDecoration>(
  light: (context) => BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(appBorderRadius)),
    border: Border.all(color: Colors.green[800]!),
    color: Colors.green[800],
  ),
  dark: (context) => BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(appBorderRadius)),
    border: Border.all(color: Colors.green[800]!),
    color: Colors.green[800],
  ),
);

// ResponsiveBreakpoint themeTest = ResponsiveBreakpoint<TextStyle>(
//   phone: (context) => Theme.of(context).textTheme.headline4?.copyWith(fontSize: 16),
//   tablet: (context) => Theme.of(context).textTheme.headline4?.copyWith(fontSize: 20),
//   desktop: (context) => Theme.of(context).textTheme.headline4?.copyWith(fontSize: 24),
// );

// HOLE, PAR, STROKE LABELS
ResponsiveBreakpoint cardHoleDetailsLabel = ResponsiveBreakpoint<TextStyle>(
  phone: (context) => Theme.of(context).textTheme.headline4?.copyWith(fontSize: 12),
  tablet: (context) => Theme.of(context).textTheme.headline4?.copyWith(fontSize: 14),
  desktop: (context) => Theme.of(context).textTheme.headline4?.copyWith(fontSize: 16),
);

//HOLE, PAR, STROKE VALUES
ResponsiveBreakpoint cardHoleDetailsValue = ResponsiveBreakpoint<TextStyle>(
  phone: (context) => Theme.of(context).textTheme.headline4?.copyWith(fontSize: 24),
  tablet: (context) => Theme.of(context).textTheme.headline4?.copyWith(fontSize: 36),
  desktop: (context) => Theme.of(context).textTheme.headline4?.copyWith(fontSize: 36),
);

class ResponsiveBreakpoint<T> {
  final Function phone;
  final Function tablet;
  final Function desktop;
  T? find(BuildContext context) {
    String name = DeviceConfig.widthBreakpointName!;
    switch (name) {
      case "phone":
        return phone(context);
      case "tablet":
        return tablet(context);
      case "desktop":
        return desktop(context);
    }
  }

  ResponsiveBreakpoint({required this.phone, required this.tablet, required this.desktop});
}

class ResponsiveTheme<T> {
  final Function light;
  final Function dark;
  T? find(BuildContext context) {
    switch (MediaQuery.of(context).platformBrightness) {
      case Brightness.dark:
        return dark(context);
      case Brightness.light:
      default:
        return light(context);
    }
  }

  ResponsiveTheme({required this.light, required this.dark});
}

// class UIColor {
//   final Color? light;
//   final Color? dark;
//   UIColor({required this.light, required this.dark});
// }

// class UITextStyle {
//   final TextStyle? light;
//   final TextStyle? dark;
//   UITextStyle({required this.light, required this.dark});
// }

// class UIButtonStyle {
//   final ButtonStyle? light;
//   final ButtonStyle? dark;
//   UIButtonStyle({required this.light, required this.dark});
// }

// class UIDecoration {
//   final Decoration? light;
//   final Decoration? dark;
//   UIDecoration({required this.light, required this.dark});
// }

// class UIBoxDecoration {
//   final BoxDecoration? light;
//   final BoxDecoration? dark;
//   UIBoxDecoration({required this.light, required this.dark});
// }

// class UIImage {
//   final AssetImage? light;
//   final AssetImage? dark;
//   UIImage({required this.light, required this.dark});
// }

// class UILinearGradient {
//   final LinearGradient? light;
//   final LinearGradient? dark;
//   UILinearGradient({required this.light, required this.dark});
// }

class Breakpoint {
  final String? breakpoint;
  final EdgeInsets? appPadding;
  final double? appMaxWidth;
  final TextStyle? caseDescriptionFontSize;

  Breakpoint({
    required this.breakpoint,
    required this.appPadding,
    required this.appMaxWidth,
    required this.caseDescriptionFontSize,
  });
  // TextStyle getCaseHeadline3(context) {}
}

//THIS MAY OR MAY NOT BE USED
Map<String, Breakpoint> _breakpoints = {
  "phone": Breakpoint(
    breakpoint: 'Phone',
    appPadding: EdgeInsets.all(mobilePadding),
    appMaxWidth: mobileMaxWidth,
    caseDescriptionFontSize: TextStyle(fontSize: 14.0),
  ),
  "tablet": Breakpoint(
    breakpoint: 'Tablet',
    appPadding: EdgeInsets.all(tabletPadding),
    appMaxWidth: tabletMaxWidth,
    caseDescriptionFontSize: TextStyle(fontSize: 16.0),
  ),
  "desktop": Breakpoint(
    breakpoint: 'Desktop',
    appPadding: EdgeInsets.all(desktopPadding),
    appMaxWidth: desktopMaxWidth,
    caseDescriptionFontSize: TextStyle(fontSize: 18.0),
  ),
};
//END THIS MAY OR MAY NOT BE USED

// DEVICE CONFIG - SCREEN SIZE AND ORIENTATION
class DeviceConfig {
  static MediaQueryData? data;

  static Orientation? orientation;
  static bool? isPortrait;
  static bool? isPhone;
  static bool? isTablet;
  static bool? isDesktop;
  //bool? isPhoneWidth;

  static double? screenWidth;
  static double? screenHeight;

  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  //** PROPERTIES FOR SYSTEM BRIGHNTESS MODE (LIGHT/DARK) */
  static Brightness? brightnessValue;
  static String? widthBreakpointName;
  //** IF THERE IS ONLY ONE COLOR/DECORATOR IN THE OBJECT IT WILL HANDLE IT */

  Breakpoint? getBreakpoint(context) => _breakpoints[widthBreakpointName];
  //TextStyle? getResponsiveTextStyle(BuildContext context, ResponsiveTextStyle textStyle) => ;

  Orientation getScreenOrientation(context) => MediaQuery.of(context).orientation;
  bool getIsPortrait(context) => MediaQuery.of(context).orientation == Orientation.portrait;
  double getScreenWidth(context) => MediaQuery.of(context).size.width;
  double getScreenHeight(context) => MediaQuery.of(context).size.height;
  double getIsPhone(context) => MediaQuery.of(context).size.width;
  double getIsTablet(context) => MediaQuery.of(context).size.width;

  //Color? getColor(BuildContext context, UIColor color) => isDark(context) ? color.dark : color.light;
  // TextStyle? getTextStyle(BuildContext context, UITextStyle textStyle) => isDark(context) ? textStyle.dark : textStyle.light;
  // ButtonStyle? geButtonStyle(BuildContext context, UIButtonStyle buttonStyle) =>
  //     isDark(context) ? buttonStyle.dark : buttonStyle.light;

  // Decoration? getDecoration(BuildContext context, UIDecoration decoration) =>
  //     isDark(context) ? decoration.dark : decoration.light;
  // BoxDecoration? getBoxDecoration(BuildContext context, UIBoxDecoration decoration) =>
  //     isDark(context) ? decoration.dark : decoration.light;
  // AssetImage? getAssetImage(BuildContext context, UIImage assetImage) => isDark(context) ? assetImage.dark : assetImage.light;
  // LinearGradient? getLinearGradient(BuildContext context, UILinearGradient linearGradient) =>
  //     isDark(context) ? linearGradient.dark : linearGradient.light;

// NOT USED
  // TextStyle? getResponsiveTextStyle(BuildContext context, ResponsiveTextStyle textStyle) => isPhone!
  //     ? textStyle.phone
  //     : isTablet!
  //         ? textStyle.tablet
  //         : textStyle.desktop;

  bool isPhoneWidth(BuildContext context) => MediaQuery.of(context).size.width < 600;
  bool isDark(BuildContext context) => MediaQuery.of(context).platformBrightness == Brightness.dark;

  void init(BuildContext context) {
    data = MediaQuery.of(context);

    orientation = data!.orientation;
    isPortrait = orientation == Orientation.portrait;

    screenWidth = data!.size.width;
    screenHeight = data!.size.height;

    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;

//THIS MAY OR MAY NOT BE USED
    List<List> widthBreakpoints = [
      ["phone", 0],
      ["tablet", 700],
      ["desktop", 1025]
    ];
    widthBreakpointName =
        (widthBreakpoints.reversed.firstWhere((kv) => kv[1] <= screenWidth, orElse: () => widthBreakpoints[0]))[0];

    isPhone = widthBreakpointName == 'phone';

//END THIS MAY OR MAY NOT BE USED

    //** PROPERTIES FOR SYSTEM BRIGHNTESS MODE (LIGHT/DARK) */
    brightnessValue = MediaQuery.of(context).platformBrightness;
  }
}
