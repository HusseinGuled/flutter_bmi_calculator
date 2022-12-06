import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Reusebales/reuseble_container.dart';
import 'next_screen.dart';

enum Gender { male, female }

class MyScreen extends StatefulWidget {
  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  double height = 180;
  int weight = 60;
  int age = 20;

  Gender selectedGender = Gender.male;

  void _goToNextScreen() {
    double _result = weight / pow(height / 100, 2);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => NextScreen(
                  result: _result,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Color(0xff0A0A21),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusebleContainer(
                  isSelected: selectedGender == Gender.male ? true : false,
                  onPress: (() {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  }),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.mars,
                            color: Colors.white, size: 70),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("MALE", style: TextStyle(color: Colors.grey))
                      ]),
                ),
              ),
              Expanded(
                child: ReusebleContainer(
                  isSelected: selectedGender == Gender.female ? true : false,
                  onPress: (() {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  }),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.venus,
                            color: Colors.white, size: 70),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("FEMALE", style: TextStyle(color: Colors.grey))
                      ]),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReusebleContainer(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "HEIGHT",
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.round().toString(),
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 32),
                  ),
                  Text(
                    "cm",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SliderTheme(
                data: SliderThemeData(
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.grey,
                    thumbColor: Colors.red,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10)),
                child: Slider(
                  value: height,
                  min: 20,
                  max: 300,
                  onChanged: (newValue) {
                    setState(() {
                      height = newValue;
                    });
                  },
                ),
              ),
            ],
          )),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusebleContainer(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT", style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 32),
                        ),
                        Text(
                          "kg",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              if (weight > 0) weight--;
                            });
                          },
                          child: Icon(Icons.remove, color: Colors.white),
                          fillColor: Colors.grey,
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            height: 30,
                            width: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                          child: Icon(Icons.add, color: Colors.white),
                          fillColor: Colors.grey,
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
              ),
              Expanded(
                child: ReusebleContainer(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "AGE",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Yrs",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              if (age > 0) age--;
                            });
                          },
                          child: Icon(Icons.remove),
                          fillColor: Colors.grey,
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            height: 30,
                            width: 30,
                          ),
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                          child: Icon(Icons.add),
                          fillColor: Colors.grey,
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
        RawMaterialButton(
          onPressed: _goToNextScreen,
          child: Text(
            "Calculate",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
          fillColor: Colors.red,
          constraints: BoxConstraints.tightFor(
            width: double.infinity,
            height: 50,
          ),
        ),
      ]),
    );
  }
}
