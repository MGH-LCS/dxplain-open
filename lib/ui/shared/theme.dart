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
        foregroundColor: Colors.green,
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
      // cardTheme: CardTheme(
      //   shape: RoundedRectangleBorder(
      //     side: BorderSide(color: Colors.grey[400]!, width: 1.0),
      //     borderRadius: BorderRadius.circular(appBorderRadius),
      //   ),
      // ),
    );
  }

  //DARK THEME
  static ThemeData get darkTheme {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.green,
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
      // cardTheme: CardTheme(
      //   shape: RoundedRectangleBorder(
      //     side: BorderSide(color: Colors.grey[100]!, width: 1.0),
      //     borderRadius: BorderRadius.circular(appBorderRadius),
      //   ),
      // ),
    );
  }
}

// SIZE VARIABLES

double appBorderRadius = 22.5;

double cardElevation = 0;

// SIZES FOR THE SYMPTOM BUTTONS THE USER INTERACTS WITH
// Includes both sizes for phones and desktop devices

//MOBILE SIZES
double mobilePadding = 12;
double mobileSpacing = 12;
double mobileMaxWidth = DeviceConfig.screenWidth! - mobilePadding;
double mobileCardBorderRadius = mobileSymptomButtonHeight / 2;
double mobileDiagnosisContentPaddingVertical = 16;
double mobileDiagnosisContentPaddingHorizontal = 16;
double mobileDiagnosisIconPaddingRight = 0;
double mobileSymptomButtonWidth = (mobileMaxWidth / 2) - mobilePadding;
double mobileSymptomButtonHeight = 45;
double mobileSymptomButtonSpacing = 8;
double mobileSymptomButtonRunSpacing = 8;
double mobileSymptomButtonPaddingLeft = 16;
double mobileSymptomButtonTextSize = 14;
double mobileSymptomButtonTextMinSize = 7;
double mobileSymptomDefinitionButtonSize = mobileSymptomButtonHeight;
int mobileSymptomTextMaxLines = 4;

double mobileHoleIllustrationWidth = 235;
double mobileHoleIllustrationHeight = 80;
double mobileHoleDetailsWidth = 65;
double mobileGolfBallDiameter = 10;
double mobileGolfBallStartPositionLeft = 5;
double mobileGolfBallStartPositionTop = 23;
double mobileGolfBallTolerance = .1;

double mobileGreenPositionLeft = 150;
double mobileGreenPositionTop = 26;
double mobileGreenWidth = 74;
double mobileGreenHeight = 36;

double mobileCupPositionLeft = 209;
double mobileCupPositionTop = 29;
double mobileCupWidth = 10;
double mobileCupHeight = 20;

//Tablet Sizes
double tabletPadding = 24;
double tabletSpacing = 16;
double tabletMaxWidth = DeviceConfig.screenWidth! - tabletPadding;
double tabletCardBorderRadius = tabletSymptomButtonHeight / 2;
double tabletDiagnosisContentPaddingVertical = 24;
double tabletDiagnosisContentPaddingHorizontal = 24;
double tabletDiagnosisIconPaddingRight = 24;
double tabletSymptomButtonWidth = (tabletMaxWidth / 2) - tabletPadding;
double tabletSymptomButtonHeight = 65;
double tabletSymptomButtonSpacing = 12;
double tabletSymptomButtonRunSpacing = 12;
double tabletSymptomButtonPaddingLeft = 28;
double tabletSymptomButtonTextSize = 16;
double tabletSymptomButtonTextMinSize = 10;
double tabletSymptomDefinitionButtonSize = tabletSymptomButtonHeight;
int tabletSymptomTextMaxLines = 3;

double tabletHoleIllustrationWidth = 600;
double tabletHoleIllustrationHeight = 150;
double tabletHoleDetailsWidth = 120;
double tabletGolfBallDiameter = 20;
double tabletGolfBallStartPositionLeft = 15;
double tabletGolfBallStartPositionTop = 48;
double tabletGolfBallTolerance = .2;

double tabletGreenPositionLeft = 385;
double tabletGreenPositionTop = 39;
double tabletGreenWidth = 189;
double tabletGreenHeight = 93;

double tabletCupPositionLeft = 540;
double tabletCupPositionTop = 62;
double tabletCupWidth = 20;
double tabletCupHeight = 40;

//DESKTOP SIZES
double desktopPadding = 36;
double desktopSpacing = 20;
double desktopMaxWidth = 1024 - desktopPadding;
double desktopCardBorderRadius = desktopSymptomButtonHeight / 2;
double desktopDiagnosisContentPaddingVertical = 36;
double desktopDiagnosisContentPaddingHorizontal = 24;
double desktopDiagnosisIconPaddingRight = 24;
double desktopSymptomButtonWidth = ((desktopMaxWidth - (desktopPadding / 2)) / 2);
double desktopSymptomButtonHeight = 75;
double desktopSymptomButtonSpacing = 16;
double desktopSymptomButtonRunSpacing = 16;
double desktopSymptomButtonPaddingLeft = 30;
double desktopSymptomButtonTextSize = 16;
double desktopSymptomButtonTextMinSize = 10;
double desktopSymptomDefinitionButtonSize = desktopSymptomButtonHeight;
int desktopSymptomTextMaxLines = 4;

double desktopHoleIllustrationWidth = 600;
double desktopHoleIllustrationHeight = 150;
double desktopHoleDetailsWidth = 120;
double desktopGolfBallDiameter = 20;
double desktopGolfBallStartPositionLeft = 15;
double desktopGolfBallStartPositionTop = 48;
double desktopGolfBallTolerance = .2;

double desktopGreenPositionLeft = 385;
double desktopGreenPositionTop = 39;
double desktopGreenWidth = 189;
double desktopGreenHeight = 93;

double desktopCupPositionLeft = 540;
double desktopCupPositionTop = 62;
double desktopCupWidth = 20;
double desktopCupHeight = 40;

// SYMPTOM BUTTON THEMES

// COLORS
Color? dxplainOpenColor = CupertinoColors.systemGreen.color;

Color? dangerColor = Colors.red[600];

Color? defaultButtonColor = Colors.grey[500];

ResponsiveTheme appBarIconColor = ResponsiveTheme<Color>(
  light: (context) => Colors.green,
  dark: (context) => Colors.green,
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

ResponsiveBreakpoint uiAppSpacing = ResponsiveBreakpoint(
  phone: (context) => mobileSpacing,
  tablet: (context) => tabletSpacing,
  desktop: (context) => desktopSpacing,
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

ResponsiveBreakpoint symptomButtonPaddingLeft = ResponsiveBreakpoint(
  phone: (context) => mobileSymptomButtonPaddingLeft,
  tablet: (context) => tabletSymptomButtonPaddingLeft,
  desktop: (context) => desktopSymptomButtonPaddingLeft,
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

ResponsiveBreakpoint diagnosisContentPadding = ResponsiveBreakpoint(
  phone: (context) =>
      EdgeInsets.symmetric(vertical: mobileDiagnosisContentPaddingVertical, horizontal: mobileDiagnosisContentPaddingHorizontal),
  tablet: (context) =>
      EdgeInsets.symmetric(vertical: tabletDiagnosisContentPaddingVertical, horizontal: tabletDiagnosisContentPaddingHorizontal),
  desktop: (context) => EdgeInsets.symmetric(
      vertical: desktopDiagnosisContentPaddingVertical, horizontal: desktopDiagnosisContentPaddingHorizontal),
);

ResponsiveBreakpoint diagnosisIconPaddingRight = ResponsiveBreakpoint(
  phone: (context) => mobileDiagnosisIconPaddingRight,
  tablet: (context) => tabletDiagnosisIconPaddingRight,
  desktop: (context) => desktopDiagnosisIconPaddingRight,
);

// THE DIAGNOSIS DROPDOWN SELECTOR DECORATOR
ResponsiveTheme diagnosisDecoration = ResponsiveTheme<InputDecoration>(
  light: (context) => InputDecoration(
    contentPadding: diagnosisContentPadding.find(context),
    filled: true,
    fillColor: Colors.white,
    hintText: 'Enter your diagnosis',
    suffixIcon: Padding(
      padding: EdgeInsets.only(right: diagnosisIconPaddingRight.find(context)),
      child: Icon(Icons.arrow_drop_down),
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
        borderRadius: BorderRadius.circular(cardBorderRadius.find(context))),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[100]!, width: 1),
        borderRadius: BorderRadius.circular(cardBorderRadius.find(context))),
  ),
  dark: (context) => InputDecoration(
    contentPadding: diagnosisContentPadding.find(context),
    filled: true,
    fillColor: Colors.grey[800],
    hintText: 'Enter your diagnosis',
    suffixIcon: Padding(
      padding: EdgeInsets.only(right: diagnosisIconPaddingRight.find(context)),
      child: Icon(Icons.arrow_drop_down),
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
        borderRadius: BorderRadius.circular(cardBorderRadius.find(context))),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[100]!, width: 1),
        borderRadius: BorderRadius.circular(cardBorderRadius.find(context))),
  ),
);

// DECORATOR FOR THE HOLE AND DIAGNOSIS CARD
ResponsiveTheme cardDecoration = ResponsiveTheme<RoundedRectangleBorder>(
  light: (context) => RoundedRectangleBorder(
    side: BorderSide(color: Colors.grey[400]!, width: 1.0),
    borderRadius: BorderRadius.circular(cardBorderRadius.find(context)),
  ),
  dark: (context) => RoundedRectangleBorder(
    side: BorderSide(color: Colors.grey[400]!, width: 1.0),
    borderRadius: BorderRadius.circular(cardBorderRadius.find(context)),
  ),
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

ResponsiveBreakpoint cardBorderRadius = ResponsiveBreakpoint(
  phone: (context) => mobileCardBorderRadius,
  tablet: (context) => tabletCardBorderRadius,
  desktop: (context) => desktopCardBorderRadius,
);

// HOLE CARD DECORATIONS AND THEMES
// HOLE
ResponsiveTheme cardHoleDecoration = ResponsiveTheme<BoxDecoration>(
  light: (context) => BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(cardBorderRadius.find(context))),
    border: Border.all(color: Colors.green[400]!),
    color: Colors.green[400],
  ),
  dark: (context) => BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(cardBorderRadius.find(context))),
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
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(cardBorderRadius.find(context))),
    border: Border.all(color: Colors.green[800]!),
    color: Colors.green[800],
  ),
  dark: (context) => BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(cardBorderRadius.find(context))),
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

ResponsiveBreakpoint holeDetailsWidth = ResponsiveBreakpoint(
  phone: (context) => mobileHoleDetailsWidth,
  tablet: (context) => tabletHoleDetailsWidth,
  desktop: (context) => desktopHoleDetailsWidth,
);

ResponsiveBreakpoint golfBallDiameter = ResponsiveBreakpoint(
  phone: (context) => mobileGolfBallDiameter,
  tablet: (context) => tabletGolfBallDiameter,
  desktop: (context) => desktopGolfBallDiameter,
);

class GolfHole {
  double width;
  double height;
  double teeLeft;
  double teeTop;
  double greenLeft;
  double greenTop;
  double greenWidth;
  double greenHeight;
  double cupLeft;
  double cupTop;
  double cupWidth;
  double cupHeight;
  double ballDiameter;
  double ballTolerance;

  GolfHole({
    required this.width,
    required this.height,
    required this.teeLeft,
    required this.teeTop,
    required this.greenLeft,
    required this.greenTop,
    required this.greenWidth,
    required this.greenHeight,
    required this.cupLeft,
    required this.cupTop,
    required this.cupWidth,
    required this.cupHeight,
    required this.ballDiameter,
    required this.ballTolerance,
  });
}

ResponsiveBreakpoint golfHoleLayout = ResponsiveBreakpoint<GolfHole>(
  phone: (context) => GolfHole(
    width: mobileHoleIllustrationWidth,
    height: mobileHoleIllustrationHeight,
    teeLeft: mobileGolfBallStartPositionLeft,
    teeTop: mobileGolfBallStartPositionTop,
    greenLeft: mobileGreenPositionLeft,
    greenTop: mobileGreenPositionTop,
    greenWidth: mobileGreenWidth,
    greenHeight: mobileGreenHeight,
    cupLeft: mobileCupPositionLeft,
    cupTop: mobileCupPositionTop,
    cupWidth: mobileCupWidth,
    cupHeight: mobileCupHeight,
    ballDiameter: mobileGolfBallDiameter,
    ballTolerance: mobileGolfBallTolerance,
  ),
  tablet: (context) => GolfHole(
    width: tabletHoleIllustrationWidth,
    height: tabletHoleIllustrationHeight,
    teeLeft: tabletGolfBallStartPositionLeft,
    teeTop: tabletGolfBallStartPositionTop,
    greenLeft: tabletGreenPositionLeft,
    greenTop: tabletGreenPositionTop,
    greenWidth: tabletGreenWidth,
    greenHeight: tabletGreenHeight,
    cupLeft: tabletCupPositionLeft,
    cupTop: tabletCupPositionTop,
    cupWidth: tabletCupWidth,
    cupHeight: tabletCupHeight,
    ballDiameter: tabletGolfBallDiameter,
    ballTolerance: tabletGolfBallTolerance,
  ),
  desktop: (context) => GolfHole(
    width: desktopHoleIllustrationWidth,
    height: desktopHoleIllustrationHeight,
    teeLeft: tabletGolfBallStartPositionLeft,
    teeTop: desktopGolfBallStartPositionTop,
    greenLeft: desktopGreenPositionLeft,
    greenTop: desktopGreenPositionTop,
    greenWidth: desktopGreenWidth,
    greenHeight: desktopGreenHeight,
    cupLeft: desktopCupPositionLeft,
    cupTop: desktopCupPositionTop,
    cupWidth: desktopCupWidth,
    cupHeight: desktopCupHeight,
    ballDiameter: desktopGolfBallDiameter,
    ballTolerance: desktopGolfBallTolerance,
  ),
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
      ["tablet", 745],
      ["desktop", 1025]
    ];
    widthBreakpointName =
        (widthBreakpoints.reversed.firstWhere((kv) => kv[1] <= screenWidth, orElse: () => widthBreakpoints[0]))[0];
  }
}

class Globals {
  static const double xOffset_Sidebar = -14.0;
  static const Offset SideBarListOffset = (Offset(xOffset_Sidebar, 0));
  static const double xOffset_BottomSheet = -20.0;
  static const Offset BottomSheetListOffset = (Offset(xOffset_Sidebar, 0));
}
