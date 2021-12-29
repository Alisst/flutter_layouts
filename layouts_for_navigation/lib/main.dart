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
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Art Tab"),
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.art_track),
                    text: ArtUtil.CARAVAGGIO,
                  ),
                  Tab(
                    icon: Icon(Icons.art_track),
                    text: ArtUtil.MONET,
                  ),
                  Tab(
                    icon: Icon(Icons.art_track),
                    text: ArtUtil.VANGOGH,
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(ArtUtil.IMG_CARAVAGGIO),
                          fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(ArtUtil.IMG_MONET),
                          fit: BoxFit.cover)),
                ),
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(ArtUtil.IMG_VANGOGH),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
        ));
  }
}
