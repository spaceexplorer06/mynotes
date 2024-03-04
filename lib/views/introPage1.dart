import 'package:flutter/material.dart';

class introPage1 extends StatelessWidget {
  const introPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 123, 0, 1),
            Color.fromRGBO(243, 215, 174, 1),
          ],
        )),
        child: Image.asset(
          'assets/images/Delicious food1.jpg',
        ),
      ),
    ));
  }
}
