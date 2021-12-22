import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.purple,
            textTheme: TextTheme(
              bodyText2: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
            ),
            accentColor: Colors.orange),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Building Layouts with Flutter"),
          ),
          body: Center(child: Text("Hello Flutter Layout")),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.lightbulb_outline),
            onPressed: () {
              print("You rang?");
            },
          ),
          persistentFooterButtons: <Widget>[
            IconButton(icon: Icon(Icons.add_comment), onPressed: () {}),
            IconButton(icon: Icon(Icons.add_alarm), onPressed: () {}),
            IconButton(icon: Icon(Icons.add_location), onPressed: () {})
          ],
        ));
  }
}
