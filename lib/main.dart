import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/HomePage.dart';
import 'package:mynotes/views/Page1.dart';
import 'package:mynotes/views/Page2.dart';
import 'package:mynotes/views/Page3.dart';
// ignore: unused_import
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'package:mynotes/views/verify_email_view.dart';
import 'dart:developer' as devtools show log;
import 'package:mynotes/views/introPage1.dart';
import 'package:mynotes/views/introPage2.dart';
import 'package:mynotes/views/introPage3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:mynotes/views/maggie.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 210, 210)),
        useMaterial3: true,
      ),
      home: const OnBoardingScreen(),
      routes: {
        '/login/': (context) => const LoginView(),
        '/register/': (context) => const RegisterView(),
        '/notes/': (context) => const NotesView(),
        '/contact/': (context) => const Contact(),
        '/aboutus/': (context) => const AboutUs(),
        '/recipes/': (context) => const Recipes(),
        '/team/': (context) => const Team(),
        '/maggie/': (context) => const Maggie(),
        '/sandwich/': (context) => const Sandwich(),
        '/paneer/': (context) => const Paneer(),
      },
    ),
  );
}

// Onboarding Screen
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: _controller,
        onPageChanged: (index) {
          setState(() {
            onLastPage = (index == 2);
          });
        },
        children: const [
          introPage1(),
          introPage2(),
          introPage3(),
        ],
      ),
      // Dot View
      Container(
        alignment: const Alignment(0, 0.75),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // skip
            GestureDetector(
              onTap: () {
                _controller.jumpToPage(2);
              },
              child: const Text('Skip'),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const JumpingDotEffect(
                activeDotColor: Colors.orange,
                verticalOffset: 10,
              ),
            ),
            // Done
            onLastPage
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const HomePage();
                      }));
                    },
                    child: const Text('Done'),
                  )
                : GestureDetector(
                    onTap: () {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn);
                    },
                    child: const Text('Next'),
                  )
          ],
        ),
      )
    ]));
  }
}
