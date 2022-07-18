import 'dart:convert';

import 'package:dxplain_open/model/data_model.dart';
import 'package:dxplain_open/utils.dart';
import 'package:dxplain_open/view_model/base_view_model.dart';
import 'package:flutter/material.dart';

import '../ui/shared/theme.dart';

class HomePageViewModel extends BaseViewModel {
  late DataModel dataModel;
  TextEditingController diseasesController = TextEditingController();
  FocusNode focusNode = FocusNode();

  List<int> answers = <int>[];

  GolfHole? layout;
  double left = 0;
  double top = 0;
  double holeWidth = 0;
  double holeHeight = 0;
  double greenLeft = 0;
  double greenTop = 0;
  double greenWidth = 0;
  double greenHeight = 0;
  double cupLeft = 0;
  double cupTop = 0;
  double cupHeight = 0;
  double cupWidth = 0;
  double teeToHoleWidth = 0;
  double leftBallMovePerStroke = 0;
  double topBallMovePerStroke = 0;
  double teeToHoleHeight = 0;
  double ballDiameter = 0;
  double ballTolerance = 0;

  double variationLeft = 0;
  double variationTop = 0;

  int stroke = 0;
  int currentScore = 0;
  int highestScore = 0;

  int correctCount = 0;

  double scaleX = 1;
  double scaleY = 1;

  double tempX = 0;

  late AnimationController controllerX;
  late AnimationController controllerY;

  Future<void> loadData() async {
    String data = await DefaultAssetBundle.of(buildContext!).loadString("assets/data/data.json");
    dataModel = DataModel.fromJson(jsonDecode(data));
    dataModel.data[0].findings.shuffle();
    correctCount = dataModel.data[0].findings.where((element) => element.isCorrect).toList().length;
    AnswerModel findingModel = dataModel.data[0].answers.reduce((value, element) => value.score > element.score ? value : element);
    highestScore = findingModel.score + 1;
    processStatus = ProcessStatus.completed;
    notifyListeners();
  }

  void initState(BuildContext context) {
    layout = golfHoleLayout.find(context);
    left = layout!.teeLeft;
    variationLeft = layout!.teeLeft;
    top = layout!.teeTop;
    variationTop = layout!.teeTop;
    holeWidth = layout!.width;
    holeHeight = layout!.height;
    greenLeft = layout!.greenLeft;
    greenTop = layout!.greenTop;
    greenWidth = layout!.greenWidth;
    greenHeight = layout!.greenHeight;
    cupLeft = layout!.cupLeft;
    cupTop = layout!.cupTop;
    cupHeight = layout!.cupHeight;
    cupWidth = layout!.cupWidth;
    ballDiameter = layout!.ballDiameter;
    ballTolerance = layout!.ballTolerance;
    teeToHoleWidth = holeWidth - (holeWidth - cupLeft + left + (ballDiameter / 2));
    leftBallMovePerStroke = (teeToHoleWidth / highestScore) + ballTolerance;
    teeToHoleHeight = (top - (cupTop + cupHeight) + ballDiameter).abs();
    topBallMovePerStroke = (teeToHoleHeight / highestScore);
    debugPrint("$holeWidth | $teeToHoleWidth | $leftBallMovePerStroke");
    debugPrint("$holeHeight | $teeToHoleHeight | $topBallMovePerStroke");
    //notifyListeners();
    /*widget.symptomStream.listen((kv) {
      symptomChanged(kv);
    });*/
  }

  void onFindingClicked(FindingModel findingModel) async {
    if (!findingModel.isClicked) {
      stroke++;
      if (findingModel.isCorrect) {
        answers.add(findingModel.id);
        answers.sort();
        int score = dataModel.data[0].answers.where((element) => element.combination == answers.join(",")).toList()[0].score;
        onCorrect(score);
        /*currentScore = dataModel.data[0].answers.where((element) => element.combination == answers.join(",")).toList()[0].score;
        variationLeft = left + (leftBallMovePerStroke * currentScore);
        variationTop = top + topBallMovePerStroke + currentScore;
        if (currentScore >= 8) {
          controllerX.forward();
          controllerY.forward();
          //scaleY = 1.4;
        }
        notifyListeners();*/
      }
      if (!findingModel.isCorrect) {
        await onWrong();
      }
      findingModel.isClicked = true;
      notifyListeners();
      //isDiseaseDisable = dataModel.data[0].findings.where((element) => element.isClicked).toList().length == dataModel.data[0].findings.length;
      notifyListeners();
      /*if (isDiseaseDisable) {
        focusNode.requestFocus();
      }*/
    }
  }

  void onDiseaseSelect(DiseaseModel model) {
    focusNode.unfocus();
    diseasesController.text = "";
    stroke++;

    if (!model.isCorrect) {
      onWrong(isDisease: true);
      ScaffoldMessenger.maybeOf(buildContext!)?.showSnackBar(
        const SnackBar(
          content: Text(
            "Sorry, that is incorrect!",
            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      onCorrect(highestScore);
      diseasesController.text = diseasesController.text.toString().trim();

      ScaffoldMessenger.maybeOf(buildContext!)?.showSnackBar(
        const SnackBar(
          content: Text(
            "That is right!",
            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.green,
        ),
      );
    }

    notifyListeners();
    /*showDialog(
      context: buildContext!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            model.isCorrect ? "Correct" : "Incorrect",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          content: Text(
            model.isCorrect ? "That is right!" : "Sorry, that is incorrect!",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            )
          ],
        );
      },
    );*/
  }

  void onCorrect(int score) {
    if (score >= currentScore) {
      currentScore = score;
      variationLeft = left + (leftBallMovePerStroke * currentScore);
      variationTop = top + topBallMovePerStroke + currentScore;
      int percentage = ((currentScore / highestScore) * 100).round();
      if (percentage >= 70) {
        controllerX.forward();
        controllerY.forward();
        //scaleY = 1.4;
      }
      tempX = 0;
    }
    notifyListeners();
  }

  Future<void> onWrong({bool isDisease = false}) async {
    if (currentScore == highestScore) {
      return;
    }
    if (variationTop == layout!.teeTop || variationTop == top + topBallMovePerStroke + currentScore) {
      variationTop = variationTop + (isDisease ? 15 : 10);
      //tempX += 2;
      //variationLeft = variationLeft + 2;
      tempX = (tempX == 0 ? variationLeft : 0) + tempX + (isDisease ? 5 : 4);
    } else if (variationTop < top + topBallMovePerStroke + currentScore) {
      variationTop = variationTop + (isDisease ? 30 : 20);
      tempX = (tempX == 0 ? variationLeft : 0) + tempX + (isDisease ? 5 : 4);
    } else {
      variationTop = variationTop - (isDisease ? 30 : 20);
      //tempX += 3;
      //variationLeft = variationLeft + 3;
      tempX = (tempX == 0 ? variationLeft : 0) + tempX + (isDisease ? 5 : 4);
    }
  }

  void setScaleX(double x) {
    scaleX = x;
    notifyListeners();
  }

  void setScaleY(double y) {
    scaleY = y;
    notifyListeners();
  }
}
