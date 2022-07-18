import 'package:dxplain_open/ui/home_page.dart';
import 'package:dxplain_open/ui/shared/theme.dart';
import 'package:dxplain_open/utils.dart';
import 'package:dxplain_open/view_model/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      navigatorKey: kNavigatorKey,
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<HomePageViewModel>(
        create: (_) => HomePageViewModel(),
        child: const HomePage(),
      ),
    );
  }
}
