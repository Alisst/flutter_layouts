import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_widget/bmi.dart';
import 'package:flutter_cupertino_widget/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: "BMI"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings_solid), label: "Settings"),
        ],
      ),
      tabBuilder: (BuildContext context, int i) {
        if (i == 0) {
          return Bmi();
        } else {
          return Settings();
        }
      },
    );
  }
}
