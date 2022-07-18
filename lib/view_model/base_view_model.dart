import 'package:flutter/material.dart';

import '../utils.dart';

class BaseViewModel extends ChangeNotifier {
  ProcessStatus processStatus = ProcessStatus.loading;
  String errorMessage = '';

  BuildContext? buildContext = kNavigatorKey.currentContext;

  void setContext(BuildContext context) => buildContext = context;
}
