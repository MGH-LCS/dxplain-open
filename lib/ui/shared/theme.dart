// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

ResponsiveBreakpoint uiAppPadding = ResponsiveBreakpoint<EdgeInsets>(
  phone: (context) => EdgeInsets.all(mobilePadding),
  tablet: (context) => EdgeInsets.all(tabletPadding),
  desktop: (context) => EdgeInsets.all(desktopPadding),
);

ResponsiveBreakpoint uiAppMaxWidth = ResponsiveBreakpoint(
  phone: (context) => mobileMaxWidth,
  tablet: (context) => tabletMaxWidth,
  desktop: (context) => desktopMaxWidth,
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

ResponsiveBreakpoint cardHoleCaseDescription = ResponsiveBreakpoint<TextStyle>(
  phone: (context) => Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14),
  tablet: (context) => Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 20),
  desktop: (context) => Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 26),
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

// DEVICE CONFIG - SCREEN SIZE
class DeviceConfig {
  static MediaQueryData? data;

  static double? screenWidth;
  static double? screenHeight;

  static String? widthBreakpointName;

  void init(BuildContext context) {
    data = MediaQuery.of(context);

    screenWidth = data!.size.width;
    screenHeight = data!.size.height;

    List<List> widthBreakpoints = [
      ["phone", 0],
      ["tablet", 700],
      ["desktop", 1025]
    ];
    widthBreakpointName =
        (widthBreakpoints.reversed.firstWhere((kv) => kv[1] <= screenWidth, orElse: () => widthBreakpoints[0]))[0];
  }
}
