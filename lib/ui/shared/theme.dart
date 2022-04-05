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
        headline3: TextStyle(color: Colors.white, fontSize: 12),
        headline4: TextStyle(color: Colors.white, fontSize: 24),
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
        headline3: TextStyle(color: Colors.white, fontSize: 12),
        headline4: TextStyle(color: Colors.white, fontSize: 24),
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
double desktopPadding = 24;

double mobileMaxWidth = DeviceConfig.screenWidth! - mobilePadding;
double desktopMaxWidth = 500;

double cardElevation = 0;

// SIZES FOR THE SYMPTOM BUTTONS THE USER INTERACTS WITH
// Includes both sizes for phones and desktop devices

//MOBILE SIZES
double mobileSymptomButtonWidth = (mobileMaxWidth / 2) - mobilePadding;
double mobileSymptomButtonHeight = 45;
double mobileSymptomButtonRunSpacing = 8;
double mobileSymptomTextSize = 14;
double mobileSymptomTextMinSize = 8;
int mobileSymptomTextMaxLines = 3;
double mobileSymptomDefinitionButtonSize = mobileSymptomButtonHeight;

//DESKTOP SIZES
double desktopSymptomButtonWidth = ((desktopMaxWidth - (desktopPadding / 2)) / 2);
double desktopSymptomButtonHeight = 65;
double desktopSymptomButtonRunSpacing = 8;
double desktopSymptomTextSize = 14;
double desktopSymptomTextMinSize = 10;
int desktopSymptomTextMaxLines = 4;
double desktopSymptomDefinitionButtonSize = desktopSymptomButtonHeight;

//UIColor btnSymptomBgColor = UIColor(light: Colors.grey[400], dark: Colors.grey[800]);
UIColor btnSymptomTextColor = UIColor(light: Colors.white, dark: Colors.white);
UIColor btnSymptomDefinitionIconColor = UIColor(light: Colors.white.withOpacity(.5), dark: Colors.white.withOpacity(.5));

// COLORS
Color? dxplainOpenColor = CupertinoColors.systemGreen.color;

Color? dangerColor = Colors.red[600];

Color? defaultButtonColor = Colors.grey[500];

UIColor divDividerColor = UIColor(light: Colors.grey[400], dark: Colors.grey[300]);
UIColor menuIconColor = UIColor(light: CupertinoColors.systemGreen.color, dark: Colors.green[300]);

// UIDecoration cardHoleDecoration = UIDecoration(light: cardDecoration, dark: cardDecoration);

// COLORS AND DECORATIONS FOR THE CASE CARD

UIColor cardCaption = UIColor(light: Colors.white, dark: Colors.white);
UIColor cardHeadline = UIColor(light: Colors.white, dark: Colors.white);

// **** SYMPTOM BUTTON STYLES ************************************************************************** //
UIButtonStyle symptomButtonOff = UIButtonStyle(
  light: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DeviceConfig.isPhone! ? mobileSymptomButtonHeight : desktopSymptomButtonHeight),
      ),
    ),
  ),
  dark: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DeviceConfig.isPhone! ? mobileSymptomButtonHeight : desktopSymptomButtonHeight),
      ),
    ),
  ),
);

UIButtonStyle symptomButtonPresent = UIButtonStyle(
  light: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DeviceConfig.isPhone! ? mobileSymptomButtonHeight : desktopSymptomButtonHeight),
      ),
    ),
  ),
  dark: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DeviceConfig.isPhone! ? mobileSymptomButtonHeight : desktopSymptomButtonHeight),
      ),
    ),
  ),
);

UIButtonStyle symptomButtonAbsent = UIButtonStyle(
  light: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DeviceConfig.isPhone! ? mobileSymptomButtonHeight : desktopSymptomButtonHeight),
      ),
    ),
  ),
  dark: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
    padding: MaterialStateProperty.all(EdgeInsets.all(0)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DeviceConfig.isPhone! ? mobileSymptomButtonHeight : desktopSymptomButtonHeight),
      ),
    ),
  ),
);
// ****  END SYMPTOM BUTTON STYLES ********************************************************************** //

UIBoxDecoration cardHoleDecoration = UIBoxDecoration(
  light: BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(appBorderRadius)),
    border: Border.all(color: Colors.green[400]!),
    color: Colors.green[400],
  ),
  dark: BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(appBorderRadius)),
    border: Border.all(color: Colors.green[400]!),
    color: Colors.green[400],
  ),
);

UIBoxDecoration cardParDecoration = UIBoxDecoration(
  light: BoxDecoration(
    color: Colors.green[600],
  ),
  dark: BoxDecoration(
    color: Colors.green[600],
  ),
);

UIBoxDecoration cardStrokeDecoration = UIBoxDecoration(
  light: BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(appBorderRadius)),
    border: Border.all(color: Colors.green[800]!),
    color: Colors.green[800],
  ),
  dark: BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(appBorderRadius)),
    border: Border.all(color: Colors.green[800]!),
    color: Colors.green[800],
  ),
);

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

class UIButtonStyle {
  final ButtonStyle? light;
  final ButtonStyle? dark;
  UIButtonStyle({required this.light, required this.dark});
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

class ResponsiveTextStyle {
  final TextStyle? sm;
  final TextStyle? md;
  final TextStyle? lg;
  ResponsiveTextStyle({required this.sm, required this.md, required this.lg});
}

// DEVICE CONFIG - SCREEN SIZE AND ORIENTATION
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
  ButtonStyle? geButtonStyle(BuildContext context, UIButtonStyle buttonStyle) =>
      isDark(context) ? buttonStyle.dark : buttonStyle.light;

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
