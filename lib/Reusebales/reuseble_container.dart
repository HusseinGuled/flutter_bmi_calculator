import 'package:flutter/material.dart';

class ReusebleContainer extends StatelessWidget {
  final Widget? child;
  bool isSelected;
  final Function()? onPress;
  ReusebleContainer({this.child, this.isSelected = false, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? Color.fromARGB(0, 150, 150, 152)
                : Color(0xff1D1E33)),
      ),
    );
  }
}
