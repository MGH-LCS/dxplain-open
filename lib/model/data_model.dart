class DataModel {
  DataModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  int statusCode;
  String message;
  List<Data> data;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        statusCode: json["statusCode"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    required this.description,
    required this.findings,
    required this.answers,
    required this.disease,
    required this.date,
    required this.hole,
    required this.par,
    required this.stroke,
  });

  String description;
  List<FindingModel> findings;
  List<AnswerModel> answers;
  List<DiseaseModel> disease;
  String date;
  int hole;
  int par;
  int stroke;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        description: json["description"],
        findings: List<FindingModel>.from(json["findings"].map((x) => FindingModel.fromJson(x))),
        answers: List<AnswerModel>.from(json["answers"].map((x) => AnswerModel.fromJson(x))),
        disease: List<DiseaseModel>.from(json["disease"].map((x) => DiseaseModel.fromJson(x))),
        date: json["date"],
        hole: json["hole"],
        par: json["par"],
        stroke: json["stroke"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "findings": List<dynamic>.from(findings.map((x) => x.toJson())),
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "disease": List<dynamic>.from(disease.map((x) => x.toJson())),
      };
}

class AnswerModel {
  AnswerModel({
    required this.combination,
    required this.score,
  });

  String combination;
  int score;

  factory AnswerModel.fromJson(Map<String, dynamic> json) => AnswerModel(
        combination: json["combination"],
        score: json["score"],
      );

  Map<String, dynamic> toJson() => {
        "combination": combination,
        "score": score,
      };
}

class DiseaseModel {
  DiseaseModel({
    required this.name,
    required this.id,
    required this.isCorrect,
  });

  String name;
  int id;
  bool isCorrect;

  factory DiseaseModel.fromJson(Map<String, dynamic> json) => DiseaseModel(
        name: json["name"],
        id: json["id"],
        isCorrect: json["is_correct"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class FindingModel {
  FindingModel({
    required this.id,
    required this.name,
    required this.fid,
    required this.isCorrect,
    this.isClicked = false,
  });

  int id;
  String name;
  int fid;
  bool isCorrect;
  bool isClicked;

  factory FindingModel.fromJson(Map<String, dynamic> json) => FindingModel(
        id: json["id"],
        name: json["name"],
        fid: json["fid"],
        isCorrect: json["isCorrect"],
        isClicked: json["isClicked"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "fid": fid,
        "isCorrect": isCorrect,
      };
}
