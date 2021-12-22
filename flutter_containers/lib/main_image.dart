import 'package:flutter/material.dart';

void main_image() => runApp(MyApp());

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
              margin: EdgeInsets.all(50),
              width: 400.0,
              height: 500.0,
              decoration: BoxDecoration(
                color: Colors.orange,
                gradient: LinearGradient(
                  colors: [Colors.purple.shade50, Colors.purple.shade500],
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://openclipart.org/image/300px/svg_to_png/176055/044482e2.png"),
                    //fit: BoxFit.scaleDown
                    repeat: ImageRepeat.repeatX),
                shape: BoxShape.rectangle,
              ),
            )));
  }
}
