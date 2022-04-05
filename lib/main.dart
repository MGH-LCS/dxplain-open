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
        title: SizedBox(
          height: 40,
          width: 130,
          child: SvgPicture.asset(
            "assets/images/DXplain-Open-Logo.svg",
            matchTextDirection: false,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(DeviceConfig.isPhone! ? mobilePadding : desktopPadding * 2),
            child: Center(
              child: Column(
                // mainAxisAlignment: DeviceConfig.isPhone! ? MainAxisAlignment.start : MainAxisAlignment.start,
                // crossAxisAlignment: DeviceConfig.isPhone! ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: DeviceConfig.isPhone! ? mobileMaxWidth : desktopMaxWidth,
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
          definition: '1',
          buttonState: 'present',
        ),
        SymptomButton(
          clinicalName: 'dihydrorhodamine assay abnormal',
          definition: '3',
          buttonState: 'present',
        ),
        SymptomButton(
          clinicalName: 'PCR of saliva, stool or CSF positive for Tropheryma whipplei',
          definition: '',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'upper extremity muscle weakness, unilateral',
          definition: '3',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'toe paresthesia',
          definition: '1',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'PAS-positive macrophages on small bowel biopsy',
          definition: '1',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'migratory polyarthritis',
          definition: '',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'symptoms improve on gluten-free diet',
          definition: '4',
          buttonState: 'absent',
        ),
        SymptomButton(
          clinicalName: 'upper extremity pulse decrease with head maneuver or Valsalva',
          definition: '',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'distal symmetric polyneuropathy',
          definition: '1',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'finger agnosia',
          definition: '1',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'arsenic exposure',
          definition: '3',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'nail banding, transverse white',
          definition: '4',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'polyserositis',
          definition: '3',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'morning stiffness',
          definition: '4',
          buttonState: 'off',
        ),
        SymptomButton(
          clinicalName: 'glucose intolerance',
          definition: '3',
          buttonState: 'off',
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

  SymptomButton({
    required this.clinicalName,
    required this.definition,
    required this.buttonState,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DeviceConfig.isPhone! ? mobileSymptomButtonWidth : desktopSymptomButtonWidth,
      height: DeviceConfig.isPhone! ? mobileSymptomButtonHeight : desktopSymptomButtonHeight,
      child: OutlinedButton(
        onPressed: () {},
        style: buttonState == 'off'
            ? DeviceConfig().geButtonStyle(context, symptomButtonOff)
            : (buttonState == 'present'
                ? DeviceConfig().geButtonStyle(context, symptomButtonPresent)
                : DeviceConfig().geButtonStyle(context, symptomButtonAbsent)),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: definition != '' ? 0 : 16),
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
              // THE RIGHT JUSTIFIED ICON THAT IS ONLY PRESENT IF THE SYMPTOM HAS A DEFINITION
              Visibility(
                visible: definition != '',
                child: Material(
                  color: Colors.grey[200]!.withOpacity(.1),
                  shape: const CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: IconButton(
                    constraints: BoxConstraints(
                        maxHeight: DeviceConfig.isPhone! ? mobileSymptomDefinitionButtonSize : desktopSymptomDefinitionButtonSize,
                        maxWidth: DeviceConfig.isPhone! ? mobileSymptomDefinitionButtonSize : desktopSymptomDefinitionButtonSize,
                        minWidth: DeviceConfig.isPhone! ? mobileSymptomDefinitionButtonSize : desktopSymptomDefinitionButtonSize,
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
                                Text('HOLE', style: Theme.of(context).textTheme.headline3),
                                Text('1', style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 24)),
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
                                Text('PAR', style: Theme.of(context).textTheme.headline3),
                                Text('8', style: Theme.of(context).textTheme.headline4),
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
                        Text("Jan 1, 2022"),
                        SizedBox(height: 10.0),
                        Text(
                          "45 year old female presents with airway compression or obstruction for the past 24 hours",
                          maxLines: 100,
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
                                Text('STROKE', style: Theme.of(context).textTheme.headline3),
                                Text('3', style: Theme.of(context).textTheme.headline4),
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
