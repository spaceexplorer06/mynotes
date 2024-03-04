import 'package:flutter/material.dart';

class Maggie extends StatefulWidget {
  const Maggie({super.key});

  @override
  State<Maggie> createState() => _MaggieState();
}

class _MaggieState extends State<Maggie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(500),
            child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/maggie.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 255, 176, 48),
              title: const Center(child: Text('Maggie')),
            )),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 15,
                      spreadRadius: 1.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange[200],
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/recipes/', (route) => false);
                  },
                  child: const Text('Back to Recipes'),
                ),
              )
            ],
          ),
        ));
  }
}
