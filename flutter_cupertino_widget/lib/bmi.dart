import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_widget/util.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  late int unit;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("BMI"),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
            child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: height * 0.8),
                child: Column(
                  children: [
                    Image.network("https://bit.ly/img_bmi"),
                    Util.paddingTop,
                    Row(
                      children: [
                        Util.paddingLeft,
                        Container(
                          child: Text("Height"),
                          width: width / 3,
                        ),
                        Expanded(
                            child: CupertinoTextField(
                          controller: heightController,
                        ))
                      ],
                    ),
                    Util.paddingTop,
                    Row(
                      children: [
                        Util.paddingLeft,
                        Container(
                          child: Text("Weight"),
                          width: width / 3,
                        ),
                        Expanded(
                            child: CupertinoTextField(
                          controller: weightController,
                        ))
                      ],
                    ),
                    Expanded(
                      child: Util.paddingTop,
                    ),
                    CupertinoButton.filled(
                        child: Text("Calculate BMI"),
                        onPressed: () {
                          showResult();
                        }),
                    Util.paddingTop
                  ],
                ))),
      ),
    );
  }

  void showResult() async {
    double height;
    double weight;
    int unit = await Util.getSettings();
    height = double.tryParse(heightController.text) ?? 0;
    weight = double.tryParse(weightController.text) ?? 0;

    double result = Util.calculateBMI(height, weight, unit);
    String message = "Your BMI is " + result.toStringAsFixed(2);
    CupertinoAlertDialog dialog = CupertinoAlertDialog(
      title: Text("Result"),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
