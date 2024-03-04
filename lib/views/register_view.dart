import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
          backgroundColor: Color.fromARGB(255, 255, 192, 124),
          title: Center(
            child: const Text(
                style: TextStyle(
                  color: Color.fromARGB(230, 251, 255, 254),
                  fontSize: 30,
                ),
                'Register'),
          ),
        ),
      ),
      body: Container(
        //decoration: const BoxDecoration(
        //    gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        //  Color.fromARGB(255, 255, 255, 255),
        //  Color.fromARGB(255, 0, 0, 0)
        //])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Enter your email here'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _password,
                decoration:
                    InputDecoration(hintText: 'Enter your password here'),
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
                    final userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                    devtools.log(userCredential.toString());
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(userCredential.user!.email)
                        .set({
                      'username': email.split('@')[0], // Initial Username
                      'bio': 'Empty bio...' // Initially Empty Bio
                    });
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      devtools.log("Weak Password");
                    } else if (e.code == 'email-already-in-use') {
                      devtools.log("Email is already in use");
                    } else if (e.code == 'invalid-email') {
                      devtools.log("Invalid email");
                    }
                  }
                  const SnackBar(content: Text('Loading...'));
                },
                child: const Text(
                    style: TextStyle(color: Color.fromARGB(255, 255, 115, 1)),
                    'Register')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/login/', (route) => false);
                },
                child: const Text(
                    style: TextStyle(color: Color.fromARGB(255, 255, 115, 1)),
                    'Already Registered? Login here.'))
          ],
        ),
      ),
    );
  }
}
