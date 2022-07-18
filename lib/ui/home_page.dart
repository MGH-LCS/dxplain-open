import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dxplain_open/model/data_model.dart';
import 'package:dxplain_open/ui/shared/font_icons_icons.dart';
import 'package:dxplain_open/ui/shared/theme.dart';
import 'package:dxplain_open/utils.dart';
import 'package:dxplain_open/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get onPressed => null;
  late HomePageViewModel homePageViewModel;
  final StreamController<Map<String, String>> _symptomStream = StreamController<Map<String, String>>.broadcast();

  @override
  void initState() {
    super.initState();
    homePageViewModel = Provider.of(context, listen: false);
    homePageViewModel.loadData();
  }

  @override
  void dispose() {
    super.dispose();
    homePageViewModel.diseasesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DeviceConfig().init(context);
    return Consumer<HomePageViewModel>(
      builder: (BuildContext context, HomePageViewModel viewModel, Widget? child) {
        if (viewModel.processStatus == ProcessStatus.loading) {
          return Container();
        }
        return Scaffold(
          appBar: AppBar(
            actions: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  Utils.convertDateTime(viewModel.dataModel.data[0].date),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const HelpIconButton(),
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
                /*Expanded(
                  child: Text(
                    DeviceConfig.widthBreakpointName!.toUpperCase() + ' ' + DeviceConfig.screenWidth.toString(),
                    style: const TextStyle(color: Colors.green, fontSize: 10),
                  ),
                ),*/
              ],
            ),
          ),
          //drawer: const AppDrawer(),
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
      },
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
            title: Transform.translate(offset: Globals.SideBarListOffset, child: const Text('DXplain Open')),
            subtitle: Transform.translate(
              offset: Globals.SideBarListOffset,
              child: const Text("version: 0.1"),
            ),
            leading: const SizedBox(
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
            leading: const SizedBox(
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

  const SymptomButtons({
    required this.symptomStream,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomePageViewModel viewModel = Provider.of(context);
    return Wrap(
      spacing: symptomButtonSpacing.find(context), // gap between adjacent chips
      runSpacing: symptomButtonRunSpacing.find(context), // gap between lines
      children: List.generate(viewModel.dataModel.data[0].findings.length, (index) {
        return SymptomButton(
          homePageViewModel: viewModel,
          findingModel: viewModel.dataModel.data[0].findings[index],
        );
      }),
    );
  }
}

// THIS ARE THE SYMPTOM BUTTONS - THE LIGHTBULB/DEFINE ICON WILL NOT ALWAYS BE PRESENT - DEPENDS
// ON IF THE SYMPTOM HAS A DEFINITION THAT EXISTS IN THE DXPLAIN DATABASE
class SymptomButton extends StatelessWidget {
  final HomePageViewModel homePageViewModel;
  final FindingModel findingModel;

  const SymptomButton({
    Key? key,
    required this.homePageViewModel,
    required this.findingModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: symptomButtonWidth.find(context),
      height: symptomButtonHeight.find(context),
      child: OutlinedButton(
        onPressed: () {
          homePageViewModel.onFindingClicked(findingModel);
        },
        //The button has 3 styles,
        // off = the user has not yet selected a symptom
        // present = the user selected the symptom's button and the symptom is present in the case
        // absent = the user selected the symptom's button and the symptom is absent in the case
        style: !findingModel.isClicked ? symptomButtonOff.find(context) : (findingModel.isCorrect ? symptomButtonPresent.find(context) : symptomButtonAbsent.find(context)),
        child: Padding(
          padding: EdgeInsets.only(left: symptomButtonPaddingLeft.find(context), right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: AutoSizeText(
                    findingModel.name,
                    style: symptomButtonTextStyle.find(context),
                    minFontSize: symptomButtonTextMinSize.find(context),
                    maxLines: symptomButtonTextMaxLines.find(context),
                    wrapWords: false,
                  ),
                ),
              ),
              // THE RIGHT JUSTIFIED ICON THAT IS ONLY PRESENT IF THE SYMPTOM HAS A DEFINITION OR A STROKE COUNT
              /*Visibility(
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
              ),*/
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
    final HomePageViewModel viewModel = Provider.of(context);
    return Autocomplete<DiseaseModel>(
      optionsBuilder: (TextEditingValue value) {
        // When the field is empty
        if (value.text.isEmpty) {
          return [];
        }

        // The logic to find out which ones should appear
        return viewModel.dataModel.data[0].disease.where((suggestion) => suggestion.name.toLowerCase().contains(value.text.toLowerCase())).toList();
      },
      onSelected: viewModel.onDiseaseSelect,
      fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
        viewModel.diseasesController = fieldTextEditingController;
        viewModel.focusNode = fieldFocusNode;
        return TextField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          style: const TextStyle(height: 1),
          decoration: diagnosisDecoration.find(context),
        );
      },
      optionsMaxHeight: 250,
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<DiseaseModel> onSelected,
        Iterable<DiseaseModel> options,
      ) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Container(
              width: 300,
              color: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final DiseaseModel option = options.elementAt(index);

                  return GestureDetector(
                    onTap: () {
                      onSelected(option);
                    },
                    child: ListTile(
                      title: Text(option.name, style: const TextStyle(color: Colors.black)),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
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
    final HomePageViewModel homePageViewModel = Provider.of(context);
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
                        value: homePageViewModel.dataModel.data[0].hole,
                        decoration: cardHoleDecoration.find(context),
                      ),
                      CaseGolfDetail(
                        label: 'PAR',
                        value: homePageViewModel.dataModel.data[0].par,
                        decoration: cardParDecoration.find(context),
                      ),
                      CaseGolfDetail(
                        label: 'STROKE',
                        value: homePageViewModel.stroke,
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
                        /*Text(
                          homePageViewModel.dataModel.data[0].date,
                          style: cardHoleCaseDescription.find(context),
                        ),
                        const SizedBox(height: 10.0),*/
                        Text(
                          homePageViewModel.dataModel.data[0].description,
                          maxLines: 100,
                          style: cardHoleCaseDescription.find(context),
                        ),
                        const SizedBox(height: 10.0),
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

class _GolfHoleState extends State<GolfHoleState> with TickerProviderStateMixin {
  late HomePageViewModel homePageViewModel;

  @override
  void initState() {
    super.initState();
    homePageViewModel = Provider.of(context, listen: false);
    homePageViewModel.initState(context);

    homePageViewModel.controllerX = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      lowerBound: 1,
      upperBound: 1.6,
    );

    homePageViewModel.controllerY = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      lowerBound: 1,
      upperBound: 1.6,
    );

    homePageViewModel.controllerX.addListener(() {
      homePageViewModel.setScaleX(homePageViewModel.controllerX.value);
    });
    homePageViewModel.controllerY.addListener(() {
      homePageViewModel.setScaleY(homePageViewModel.controllerY.value);
    });
  }

  void symptomChanged(kv) {
    if (kv?["clicked"] == "1") {
      setState(() {
        if (homePageViewModel.left < homePageViewModel.teeToHoleWidth) {
          homePageViewModel.left = homePageViewModel.left + homePageViewModel.leftBallMovePerStroke;
          debugPrint(homePageViewModel.left.toString());
          homePageViewModel.top = homePageViewModel.top + homePageViewModel.topBallMovePerStroke;
        }
      });
    }
  }

  @override
  void dispose() {
    homePageViewModel.controllerX.dispose();
    homePageViewModel.controllerY.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(
      builder: (BuildContext context, HomePageViewModel viewModel, Widget? child) {
        return Center(
          child: SizedBox(
            width: viewModel.holeWidth,
            height: viewModel.holeHeight,
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 0,
              margin: const EdgeInsets.all(0),
              child: Transform.scale(
                //scale: 2,
                scaleY: viewModel.scaleY,
                scaleX: viewModel.scaleX,
                alignment: FractionalOffset.centerRight,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      top: 0,
                      child: SizedBox(
                        width: viewModel.holeWidth,
                        height: viewModel.holeHeight,
                        child: SvgPicture.asset(
                          "assets/images/Hole-Design-Alpha.svg",
                          matchTextDirection: false,
                        ),
                      ),
                    ),
                    Positioned(
                      left: viewModel.greenLeft,
                      top: viewModel.greenTop,
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
                      left: viewModel.cupLeft,
                      top: viewModel.cupTop,
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
                      child: const GolfBall(),
                      duration: const Duration(milliseconds: 100),
                      left: viewModel.tempX != 0 ? viewModel.tempX : viewModel.variationLeft,
                      top: viewModel.variationTop,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
  final String label;
  final int value;
  final Decoration decoration;

  const CaseGolfDetail({
    Key? key,
    required this.label,
    required this.value,
    required this.decoration,
  }) : super(key: key);

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
              builder: (BuildContext context) => const HelpWidget(),
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
      insetPadding: const EdgeInsets.all(24),
      title: const Text('How To Play'),
      content: SizedBox(
        width: uiAppMaxWidth.find(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
