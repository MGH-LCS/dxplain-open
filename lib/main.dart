import 'dart:async';

import 'package:dxplain_open/ui/shared/font_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:dxplain_open/ui/shared/theme.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/rendering.dart';
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

  final StreamController<Map<String, String>> _symptomStream = StreamController<Map<String, String>>.broadcast();

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        actions: const [
          HelpIconButton(),
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
              DeviceConfig.widthBreakpointName!.toUpperCase() + ' ' + DeviceConfig.screenWidth.toString(),
              style: const TextStyle(color: Colors.green, fontSize: 10),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: uiAppPadding.find(context),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: uiAppMaxWidth.find(context),
                    child: Column(
                      children: [
                        CaseCard(symptomStream: _symptomStream.stream),
                        SizedBox(height: uiAppSpacing.find(context)),
                        const DiagnosisCard(),
                        SizedBox(height: uiAppSpacing.find(context)),
                        SymptomButtons(symptomStream: _symptomStream),
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

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text('DXPlain Open'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Transform.translate(offset: Globals.SideBarListOffset, child: new Text('DXplain Open')),
            subtitle: Transform.translate(
              offset: Globals.SideBarListOffset,
              child: new Text("version: 0.1"),
            ),
            leading: SizedBox(
              width: 24,
              height: 24,
              child: Icon(
                FontIcons.square_info_solid,
                size: 18,
              ),
            ),
          ),
          ListTile(
            title: Transform.translate(
                offset: Globals.SideBarListOffset,
                child: SvgPicture.asset(
                  "assets/images/mgh-lcs.svg",
                  height: 24,
                  alignment: Alignment.topLeft,
                  color: Colors.green[600],
                )),
            leading: SizedBox(
              width: 24,
              height: 24,
              child: Icon(
                FontIcons.square_code_solid,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//THIS IS THE LIST OF SYMPTOM BUTTONS
class SymptomButtons extends StatelessWidget {
  final StreamController<Map<String, String>> symptomStream;

  SymptomButtons({
    required this.symptomStream,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: symptomButtonSpacing.find(context), // gap between adjacent chips
      runSpacing: symptomButtonRunSpacing.find(context), // gap between lines
      children: <Widget>[
        SymptomButton(
          clinicalName: 'Cough',
          definition: '',
          buttonState: 'present',
          stroke: '1',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'dihydrorhodamine assay abnormal',
          definition: '',
          buttonState: 'present',
          stroke: '2',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'PCR of saliva, stool or CSF positive for Tropheryma whipplei',
          definition: '',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'upper extremity muscle weakness, unilateral',
          definition: '3',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'toe paresthesia',
          definition: '1',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'PAS-positive macrophages on small bowel biopsy',
          definition: '1',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'migratory polyarthritis',
          definition: '1',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'symptoms improve on gluten-free diet',
          definition: '4',
          buttonState: 'absent',
          stroke: '3',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'upper extremity pulse decrease with head maneuver or Valsalva',
          definition: '1',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'distal symmetric polyneuropathy',
          definition: '1',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'finger agnosia',
          definition: '1',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'arsenic exposure',
          definition: '3',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1", "gotcha": "1"},
        ),
        SymptomButton(
          clinicalName: 'nail banding, transverse white',
          definition: '4',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'polys',
          definition: '',
          buttonState: 'off',
          stroke: '2',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName: 'morning stiffness',
          definition: '4',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
        ),
        SymptomButton(
          clinicalName:
              'Donec sodales ante et lorem fringilla, scelerisque varius turpis efficitur. Nulla consequat, risus ac massa nunc.',
          definition: '3',
          buttonState: 'off',
          stroke: '',
          stream: symptomStream,
          payload: {"clicked": "1"},
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
  StreamController<Map<String, String>> stream;
  Map<String, String> payload;

  SymptomButton({
    Key? key,
    required this.clinicalName,
    required this.definition,
    required this.buttonState,
    required this.stroke,
    required this.stream,
    required this.payload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: symptomButtonWidth.find(context),
      height: symptomButtonHeight.find(context),
      child: OutlinedButton(
        onPressed: () {
          stream.add(payload);
        },
        //The button has 3 styles,
        // off = the user has not yet selected a symptom
        // present = the user selected the symptom's button and the symptom is present in the case
        // absent = the user selected the symptom's button and the symptom is absent in the case
        style: buttonState == 'off'
            ? symptomButtonOff.find(context)
            : (buttonState == 'present' ? symptomButtonPresent.find(context) : symptomButtonAbsent.find(context)),
        child: Padding(
          padding:
              EdgeInsets.only(left: symptomButtonPaddingLeft.find(context), right: definition != '' || stroke != '' ? 0 : 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: AutoSizeText(
                    clinicalName,
                    style: symptomButtonTextStyle.find(context),
                    minFontSize: symptomButtonTextMinSize.find(context),
                    maxLines: symptomButtonTextMaxLines.find(context),
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
                          constraints: symptomButtonDefinitionConstraints.find(context),
                          color: symptomButtonDefinitionIconColor.find(context),
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
                          constraints: symptomButtonDefinitionConstraints.find(context),
                          child: Center(
                            child: Text(
                              stroke,
                              style: symptomButtonTextStyle.find(context),
                            ),
                          ),
                        ),
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
    return TextFormField(
      style: const TextStyle(height: 1),
      decoration: diagnosisDecoration.find(context),
    );
  }
}

//THIS IS THE CASE CARD THAT APPEARS AT THE VERY TOP OF THE SCREEN
class CaseCard extends StatelessWidget {
  final Stream<Map<String, String>> symptomStream;

  const CaseCard({
    required this.symptomStream,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: cardDecoration.find(context),
      margin: EdgeInsets.zero,
      elevation: cardElevation,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              children: [
                SizedBox(
                  width: holeDetailsWidth.find(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CaseGolfDetail(
                        label: 'HOLE',
                        value: 1,
                        decoration: cardHoleDecoration.find(context),
                      ),
                      CaseGolfDetail(
                        label: 'PAR',
                        value: 8,
                        decoration: cardParDecoration.find(context),
                      ),
                      CaseGolfDetail(
                        label: 'STROKE',
                        value: 1,
                        decoration: cardStrokeDecoration.find(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Jan 1, 2022",
                          style: cardHoleCaseDescription.find(context),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          "45 year old female presents with airway compression or obstruction for the past 24 hours",
                          maxLines: 100,
                          style: cardHoleCaseDescription.find(context),
                        ),
                        SizedBox(height: 10.0),
                        GolfHoleState(
                          symptomStream: symptomStream,
                          //left: golfBallStartPositionLeft.find(context),
                          //top: golfBallStartPositionTop.find(context)
                        ),
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

// THIS CONTAINS THE HOLE ILLUSTRATION AND THE GOLF BALL
class GolfHoleState extends StatefulWidget {
  final Stream<Map<String, String>> symptomStream;
  // final double left;
  // final double top;

  const GolfHoleState({
    required this.symptomStream,
    // required this.left,
    // required this.top,
    Key? key,
  }) : super(key: key);
  @override
  _GolfHoleState createState() => _GolfHoleState();
}

class _GolfHoleState extends State<GolfHoleState> {
  GolfHole? _layout;
  double _left = 0;
  double _top = 0;
  double _holeWidth = 0;
  double _holeHeight = 0;
  double _greenLeft = 0;
  double _greenTop = 0;
  double _greenWidth = 0;
  double _greenHeight = 0;
  double _cupLeft = 0;
  double _cupTop = 0;
  double _cupHeight = 0;
  double _cupWidth = 0;
  double _teeToHoleWidth = 0;
  double _leftBallMovePerStroke = 0;
  double _topBallMovePerStroke = 0;
  double _teeToHoleHeight = 0;
  double _ballDiameter = 0;
  double _ballTolerance = 0;

  @override
  void initState() {
    super.initState();
    _layout = golfHoleLayout.find(context);
    _left = _layout!.teeLeft;
    _top = _layout!.teeTop;
    _holeWidth = _layout!.width;
    _holeHeight = _layout!.height;
    _greenLeft = _layout!.greenLeft;
    _greenTop = _layout!.greenTop;
    _greenWidth = _layout!.greenWidth;
    _greenHeight = _layout!.greenHeight;
    _cupLeft = _layout!.cupLeft;
    _cupTop = _layout!.cupTop;
    _cupHeight = _layout!.cupHeight;
    _cupWidth = _layout!.cupWidth;
    _ballDiameter = _layout!.ballDiameter;
    _ballTolerance = _layout!.ballTolerance;
    _teeToHoleWidth = _holeWidth - (_holeWidth - _cupLeft + _left + (_ballDiameter / 2));
    _leftBallMovePerStroke = (_teeToHoleWidth / 16) + _ballTolerance;
    _teeToHoleHeight = (_top - (_cupTop + _cupHeight) + _ballDiameter).abs();
    _topBallMovePerStroke = (_teeToHoleHeight / 16);
    debugPrint("$_holeWidth | $_teeToHoleWidth | $_leftBallMovePerStroke");
    debugPrint("$_holeHeight | $_teeToHoleHeight | $_topBallMovePerStroke");
    widget.symptomStream.listen((kv) {
      symptomChanged(kv);
    });
  }

  void symptomChanged(kv) {
    if (kv?["clicked"] == "1") {
      setState(() {
        if (_left < _teeToHoleWidth) {
          _left = _left + _leftBallMovePerStroke;
          debugPrint(_left.toString());
          _top = _top + _topBallMovePerStroke;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: _holeWidth,
        height: _holeHeight,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: SizedBox(
                width: _holeWidth,
                height: _holeHeight,
                child: SvgPicture.asset(
                  "assets/images/Hole-Design-Alpha.svg",
                  matchTextDirection: false,
                ),
              ),
            ),
            Positioned(
              left: _greenLeft,
              top: _greenTop,
              child: SizedBox(
                width: golfHoleLayout.find(context).greenWidth,
                height: golfHoleLayout.find(context).greenHeight,
                child: SvgPicture.asset(
                  "assets/images/Hole-Green-Alpha.svg",
                  matchTextDirection: false,
                ),
              ),
            ),
            Positioned(
              left: _cupLeft,
              top: _cupTop,
              child: SizedBox(
                width: golfHoleLayout.find(context).cupWidth,
                height: golfHoleLayout.find(context).cupHeight,
                child: SvgPicture.asset(
                  "assets/images/cup.svg",
                  matchTextDirection: false,
                ),
              ),
            ),
            AnimatedPositioned(
              child: GolfBall(),
              duration: const Duration(milliseconds: 100),
              left: _left,
              top: _top,
            ),
          ],
        ),
      ),
    );
  }
}

class GolfBall extends StatelessWidget {
  const GolfBall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: golfBallDiameter.find(context),
      child: SvgPicture.asset(
        "assets/images/ball.svg",
        matchTextDirection: false,
      ),
    );
  }
}

class CaseGolfDetail extends StatelessWidget {
  String label;
  int value;
  Decoration decoration;
  CaseGolfDetail({
    required this.label,
    required this.value,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            children: [
              Text(
                label,
                style: cardHoleDetailsLabel.find(context),
              ),
              Text(
                value.toString(),
                style: cardHoleDetailsValue.find(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HelpIconButton extends StatelessWidget {
  const HelpIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => HelpWidget(),
            ),
        icon: Icon(
          Icons.help,
          color: appBarIconColor.find(context),
        ));
  }
}

class HelpWidget extends StatelessWidget {
  const HelpWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.all(24),
      title: const Text('How To Play'),
      content: SizedBox(
        width: uiAppMaxWidth.find(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to DXplain Open'),
            SizedBox(height: 10.0),
            Text(
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed eleifend ultricies nisl. Sed mollis, odio dapibus commodo suscipit, nisl massa tempor mi, quis lobortis nulla elit eget pede. Cras mollis nunc eu lectus rutrum tempus. Aenean non nibh ut ligula venenatis dapibus. Sed id felis. Aenean tellus. Cras justo lacus, cursus et, semper at, tempus eu, erat. Aenean ornare. Nulla sollicitudin eros eu massa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos hymenaeos. Quisque viverra nunc eget dui. Etiam iaculis tincidunt sapien. Aliquam erat volutpat. Mauris sagittis mi suscipit est. Maecenas adipiscing erat vestibulum purus. In scelerisque facilisis risus. In ac erat. Etiam nulla. Donec ut arcu sit amet nisi sollicitudin gravida.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
