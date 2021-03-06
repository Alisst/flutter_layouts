import 'package:flutter/material.dart';

void main_gradients() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Container App",
        home: Scaffold(
            appBar: AppBar(
              title: Text("Container"),
            ),
            body: Container(
              margin: EdgeInsets.all(100),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  gradient: RadialGradient(
                    // begin: Alignment.topCenter,
                    // end: Alignment.bottomCenter,
                    // begin: Alignment(0.0, -1.0),
                    // end: Alignment(0.0, -0.8),
                    tileMode: TileMode.clamp,
                    radius: 0.25,
                    center: Alignment(0.0, 0.5),
                    //colors: [Colors.purple.shade50, Colors.purple.shade500],
                    colors: [
                      Colors.blue,
                      Colors.green,
                      Colors.deepPurple,
                      Colors.pink
                    ],
                    //stops: [0.5, 0.6, 0.7, 0.8],
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0))),
            )));
  }
}
