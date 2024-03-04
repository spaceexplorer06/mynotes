import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Center(
          child: Text(
            'Favourites',
            style: TextStyle(
                fontFamily: 'Ingrid Darling',
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Text(
          'Wait for Updates...',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
