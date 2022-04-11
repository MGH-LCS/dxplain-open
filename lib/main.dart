import 'package:flutter/material.dart';
import 'package:dxplain_open/ui/shared/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DXplain Open',
      theme: DXPlainOpenTheme.lightTheme,
      darkTheme: DXPlainOpenTheme.darkTheme,
      home: const MyHomePage(title: 'DXplain Open'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  get onPressed => null;

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    Breakpoint responsive = DeviceConfig().getBreakpoint(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.menu,
            color: DeviceConfig().getColor(context, menuIconColor),
          ),
        ),
        actions: [
          IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.help,
                color: DeviceConfig().getColor(context, menuIconColor),
              ))
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 40,
              width: 130,
              child: SvgPicture.asset(
                "assets/images/DXplain-Open-Logo.svg",
                matchTextDirection: false,
              ),
            ),
            Text(
              responsive.breakpoint.toString() + " " + DeviceConfig.screenWidth.toString(),
              style: TextStyle(color: Colors.green, fontSize: 10),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: responsive.appPadding!,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: responsive.appMaxWidth,
                    child: Column(
                      children: [
                        CaseCard(),
                        SizedBox(height: mobilePadding),
                        DiagnosisCard(),
                        SizedBox(height: mobilePadding),
                        SymptomButtons(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//THIS IS THE LIST OF SYMPTOM BUTTONS
class SymptomButtons extends StatelessWidget {
  const SymptomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: DeviceConfig.isPhone! ? mobileSymptomButtonRunSpacing : desktopSymptomButtonRunSpacing, // gap between lines
      children: <Widget>[
        SymptomButton(
          clinicalName: 'Cough',
          definition: '',
          buttonState: 'present',
          stroke: '1',
        ),
        SymptomButton(
          clinicalName: 'dihydrorhodamine assay abnormal',
          definition: '',
          buttonState: 'present',
          stroke: '2',
        ),
        SymptomButton(
          clinicalName: 'PCR of saliva, stool or CSF positive for Tropheryma whipplei',
          definition: '',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'upper extremity muscle weakness, unilateral',
          definition: '3',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'toe paresthesia',
          definition: '1',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'PAS-positive macrophages on small bowel biopsy',
          definition: '1',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'migratory polyarthritis',
          definition: '1',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'symptoms improve on gluten-free diet',
          definition: '4',
          buttonState: 'absent',
          stroke: '3',
        ),
        SymptomButton(
          clinicalName: 'upper extremity pulse decrease with head maneuver or Valsalva',
          definition: '1',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'distal symmetric polyneuropathy',
          definition: '1',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'finger agnosia',
          definition: '1',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'arsenic exposure',
          definition: '3',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'nail banding, transverse white',
          definition: '4',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'polys',
          definition: '',
          buttonState: 'off',
          stroke: '2',
        ),
        SymptomButton(
          clinicalName: 'morning stiffness',
          definition: '4',
          buttonState: 'off',
          stroke: '',
        ),
        SymptomButton(
          clinicalName: 'glucose intolerance',
          definition: '3',
          buttonState: 'off',
          stroke: '',
        ),
      ],
    );
  }
}

// THIS ARE THE SYMPTOM BUTTONS - THE LIGHTBULB/DEFINE ICON WILL NOT ALWAYS BE PRESENT - DEPENDS
// ON IF THE SYMPTOM HAS A DEFINITION THAT EXISTS IN THE DXPLAIN DATABASE
class SymptomButton extends StatelessWidget {
  String clinicalName;
  String definition;
  String buttonState;
  String stroke;

  SymptomButton({
    required this.clinicalName,
    required this.definition,
    required this.buttonState,
    required this.stroke,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceConfig.isPhone! ? mobileSymptomButtonWidth : desktopSymptomButtonWidth,
      height: DeviceConfig.isPhone! ? mobileSymptomButtonHeight : desktopSymptomButtonHeight,
      child: OutlinedButton(
        onPressed: () {},
        //The button has 3 styles,
        // off = the user has not yet selected a symptom
        // present = the user selected the symptom's button and the symptom is present in the case
        // absent = the user selected the symptom's button and the symptom is absent in the case
        style: buttonState == 'off'
            ? DeviceConfig().geButtonStyle(context, symptomButtonOff)
            : (buttonState == 'present'
                ? DeviceConfig().geButtonStyle(context, symptomButtonPresent)
                : DeviceConfig().geButtonStyle(context, symptomButtonAbsent)),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: definition != '' || stroke != '' ? 0 : 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: AutoSizeText(
                    clinicalName,
                    style: TextStyle(
                      fontSize: DeviceConfig.isPhone! ? mobileSymptomTextSize : desktopSymptomTextSize,
                      color: DeviceConfig().getColor(context, btnSymptomTextColor),
                    ),
                    minFontSize: DeviceConfig.isPhone! ? mobileSymptomTextMinSize : desktopSymptomTextMinSize,
                    maxLines: DeviceConfig.isPhone! ? mobileSymptomTextMaxLines : desktopSymptomTextMaxLines,
                    wrapWords: false,
                  ),
                ),
              ),
              // THE RIGHT JUSTIFIED ICON THAT IS ONLY PRESENT IF THE SYMPTOM HAS A DEFINITION OR A STROKE COUNT
              Visibility(
                visible: definition != '' || stroke != '',
                child: Material(
                  color: Colors.grey[200]!.withOpacity(.1),
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: definition != '' && stroke == '',
                        child: IconButton(
                          constraints: BoxConstraints(
                              maxHeight:
                                  DeviceConfig.isPhone! ? mobileSymptomDefinitionButtonSize : desktopSymptomDefinitionButtonSize,
                              maxWidth:
                                  DeviceConfig.isPhone! ? mobileSymptomDefinitionButtonSize : desktopSymptomDefinitionButtonSize,
                              minWidth:
                                  DeviceConfig.isPhone! ? mobileSymptomDefinitionButtonSize : desktopSymptomDefinitionButtonSize,
                              minHeight:
                                  DeviceConfig.isPhone! ? mobileSymptomDefinitionButtonSize : desktopSymptomDefinitionButtonSize),
                          color: DeviceConfig().getColor(context, btnSymptomDefinitionIconColor),
                          icon: const Icon(
                            Icons.lightbulb,
                            size: 20.0,
                          ),
                          onPressed: () {},
                        ),
                      ),
                      Visibility(
                        visible: stroke != '',
                        child: Container(
                            constraints: BoxConstraints(
                                maxHeight: DeviceConfig.isPhone!
                                    ? mobileSymptomDefinitionButtonSize
                                    : desktopSymptomDefinitionButtonSize,
                                maxWidth: DeviceConfig.isPhone!
                                    ? mobileSymptomDefinitionButtonSize
                                    : desktopSymptomDefinitionButtonSize,
                                minWidth: DeviceConfig.isPhone!
                                    ? mobileSymptomDefinitionButtonSize
                                    : desktopSymptomDefinitionButtonSize,
                                minHeight: DeviceConfig.isPhone!
                                    ? mobileSymptomDefinitionButtonSize
                                    : desktopSymptomDefinitionButtonSize),
                            child: Center(
                                child: Text(
                              stroke,
                              style: TextStyle(
                                fontSize: DeviceConfig.isPhone! ? mobileSymptomTextSize : desktopSymptomTextSize,
                                color: DeviceConfig().getColor(context, btnSymptomTextColor),
                              ),
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// THIS IS THE ENTER YOUR DIAGNOSIS CARD< EVENTUALLY IT WILL BE A DROPDOWN OF CHOICES
class DiagnosisCard extends StatelessWidget {
  const DiagnosisCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: cardElevation,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: TextFormField(
          decoration: const InputDecoration(hintText: 'Enter your diagnosis', suffixIcon: Icon(Icons.arrow_drop_down)),
        ),
      ),
    );
  }
}

//THIS IS THE CASE CARD THAT APPEARS AT THE VERY TOP OF THE SCREEN
class CaseCard extends StatelessWidget {
  const CaseCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Breakpoint responsive = DeviceConfig().getBreakpoint(context)!;
    return Card(
      margin: EdgeInsets.zero,
      elevation: cardElevation,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: DeviceConfig().getBoxDecoration(context, cardHoleDecoration),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Text('HOLE', style: cardHoleDetailsHeadline3.find(context)),
                                Text('1', style: cardHoleDetailsHeadline4.find(context)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: DeviceConfig().getBoxDecoration(context, cardParDecoration),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Text('PAR', style: cardHoleDetailsHeadline3.find(context)),
                                Text('1', style: cardHoleDetailsHeadline4.find(context)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Jan 1, 2022",
                          style: responsive.caseDescriptionFontSize,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "45 year old female presents with airway compression or obstruction for the past 24 hours",
                          maxLines: 100,
                          style: responsive.caseDescriptionFontSize,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: DeviceConfig().getBoxDecoration(context, cardStrokeDecoration),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Text('STROKE', style: cardHoleDetailsHeadline3.find(context)),
                                Text('1', style: cardHoleDetailsHeadline4.find(context)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Lorem ipsum dolor sit amet, consectetuer "),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
