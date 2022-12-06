import 'package:first_app/Reusebales/reuseble_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NextScreen extends StatelessWidget {
  final double result;
  const NextScreen({super.key, required this.result});
  String checker() {
    if (result > 0 && result <= 18) {
      return 'You are UnderWeight🤗';
    } else if (result > 18 && result <= 25) {
      return 'You are Normal😍👌';
    } else if (result > 25 && result <= 29) {
      return 'You are OverWeight😂';
    } else {
      return 'You are Obese😯';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0A0A21),
          title: Text("BMI Calculator"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: ReusebleContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        result.toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        checker(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: RawMaterialButton(
                onPressed: (() {
                  Navigator.pop(context);
                }),
                child: Text(
                  "Re-calculate",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
                fillColor: Colors.red,
                constraints: BoxConstraints.tightFor(
                  width: double.infinity,
                  height: 50,
                ),
              ),
            ),
          ],
        ));
  }
}
