import 'package:flutter/material.dart';
import 'package:layouts_for_navigation/art_route.dart';

import 'art_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigating art',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: ArtRoute(art: ArtUtil.IMG_VANGOGH,),
    );
  }
}
 