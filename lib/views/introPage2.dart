import 'package:flutter/material.dart';

class introPage2 extends StatelessWidget {
  const introPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(255, 123, 0, 1),
              Color.fromRGBO(243, 215, 174, 1)
            ]),
      ),
      child: Column(
        children: [
          Container(
            alignment: const Alignment(0, 0.5),
            child: Image.asset('assets/images/Recipe.png'),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Relished Recipes',
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Ingrid Darling',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
