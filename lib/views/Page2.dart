// Home
import 'package:flutter/material.dart';
import 'package:mynotes/main.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: AppBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100))),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 178, 174, 166),
                    offset: Offset(4.0, 4.0),
                    blurRadius: 15,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 217, 215, 213),
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 15,
                    spreadRadius: 1.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage("assets/images/food background.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.all(10)),
              const Text(
                'Good Day',
                style: TextStyle(
                    fontFamily: 'Ingrid Darling',
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 200,
                        height: 100,
                        padding: const EdgeInsets.all(100),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 217, 215, 213),
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 217, 215, 213),
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange[200],
                        ),
                        child: const Center(
                          child: Text(
                            'Snacks',
                            style: TextStyle(
                                fontFamily: 'Ingrid Darling', fontSize: 10),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        width: 200,
                        height: 100,
                        padding: const EdgeInsets.all(100),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 217, 215, 213),
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 217, 215, 213),
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange[200],
                        ),
                        child: const Center(child: Text('Hi')),
                      ),
                      Container(
                        margin: const EdgeInsets.all(20),
                        width: 200,
                        height: 100,
                        padding: const EdgeInsets.all(100),
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 217, 215, 213),
                              offset: Offset(4.0, 4.0),
                              blurRadius: 15,
                              spreadRadius: 1.0,
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 217, 215, 213),
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15,
                              spreadRadius: 1.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.orange[200],
                        ),
                        child: const Center(
                          child: Text(
                            'Deserts',
                            style: TextStyle(
                                fontFamily: 'Ingrid Darling', fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      // Maggie
                      margin: const EdgeInsets.all(10),
                      width: 250,
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
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/maggie.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/recipes/', (route) => false);
                              },
                              child: const Text(
                                'Maggie',
                                style: TextStyle(
                                  fontFamily: 'Comic Neue',
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // Sandwich
                      margin: const EdgeInsets.all(10),
                      width: 250,
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
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/sandwich.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/recipes/', (route) => false);
                              },
                              child: const Text(
                                'Sandwich',
                                style: TextStyle(
                                  fontFamily: 'Comic Neue',
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      //Paneer Biriyani
                      margin: const EdgeInsets.all(10),
                      width: 250,
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
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/Bariyaani.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    '/recipes/', (route) => false);
                              },
                              child: const Text(
                                'Paneer Pulao',
                                style: TextStyle(
                                  fontFamily: 'Comic Neue',
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
