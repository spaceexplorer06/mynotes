import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/main.dart';
import 'dart:developer' as devtools show log;

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose;
    _password.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color.fromARGB(255, 235, 197, 197),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100))),
                backgroundColor: const Color.fromARGB(255, 249, 169, 95),
                title: const Center(
                  child: Center(
                    child: Text(
                        style: TextStyle(
                            color: Color.fromARGB(255, 243, 243, 243),
                            fontSize: 30),
                        'Login'),
                  ),
                ))),
        body: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _email,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              hintText: 'Enter your email here'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _password,
                          decoration: const InputDecoration(
                              hintText: 'Enter your password here'),
                          obscureText: true,
                          autocorrect: false,
                          enableSuggestions: false,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            final email = _email.text;
                            final password = _password.text;
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email, password: password);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                '/notes/',
                                (route) => false,
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                devtools.log("Something bad happened");
                              } else if (e.code == 'wrong-password') {
                                devtools.log("Wrong Password");
                              }
                            }
                          },
                          child: const Text(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 115, 1)),
                              'Login')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/register/', (route) => false);
                          },
                          child: const Text(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 115, 1)),
                              'Not Registered Yet? Register Now.'))
                    ],
                  );
                default:
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 255, 187, 16),
                    ),
                  );
              }
            }));
  }
}
