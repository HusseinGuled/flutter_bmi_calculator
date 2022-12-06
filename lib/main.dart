import 'package:flutter/material.dart';

import 'Homes/screen.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          // primaryColor: Color.fromARGB(255, 210, 25, 25),
          scaffoldBackgroundColor: Color(0xff0A0E21)),
      home: MyScreen(),
    );
  }
}
