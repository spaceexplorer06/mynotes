import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/firebase_options.dart';
import 'package:mynotes/views/Page1.dart';
import 'package:mynotes/views/Page2.dart';
import 'package:mynotes/views/Page3.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = (FirebaseAuth.instance.currentUser);
              if (user == FirebaseAuth.instance.currentUser) {
                return const LoginView();
              } else {
                return const NotesView();
              }

            //if (user?.emailVerified ?? false) {
            //} else {
            //  return const VerifyEmailView();
            //}
            default:
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 77, 216, 198),
                ),
              );
          }
        });
  }
}

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  final screens = const [Page2(), Page1(), Page3()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      backgroundColor: Color.fromARGB(255, 254, 254, 254),
      bottomNavigationBar: CurvedNavigationBar(
          color: const Color.fromARGB(255, 255, 226, 181),
          animationCurve: Curves.easeOutCubic,
          buttonBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          height: 65,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          animationDuration: const Duration(milliseconds: 300),
          items: const [
            Icon(
              Icons.home,
              color: Color.fromARGB(255, 255, 4, 0),
              size: 30,
            ),
            Icon(
              Icons.favorite,
              color: Color.fromARGB(215, 255, 162, 0),
              size: 30,
            ),
            Icon(
              Icons.person,
              color: Color.fromARGB(215, 255, 162, 0),
              size: 30,
            ),
          ],
          onTap: (index) => setState(() {
                this.index = index;
              })),
    );
  }
}

Future<bool> showlogoutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 255, 237, 189),
            title: const Text('Log Out!'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Logout')),
            ]);
      }).then((value) => value ?? false);
}

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
          backgroundColor: const Color.fromARGB(255, 255, 187, 16),
          title: const Center(child: Text('Contacts')),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/notes/', (route) => false);
            },
            child: const Text('Go to Main Page')),
      ),
    );
  }
}

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 187, 16),
          title: const Center(
            child: Text('About Us'),
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/notes/', (route) => false);
            },
            child: Container(
              child: const Text('Go to Home Page'),
            )),
      ),
    );
  }
}

class Recipes extends StatefulWidget {
  const Recipes({super.key});

  @override
  State<Recipes> createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
          backgroundColor: Color.fromARGB(255, 255, 153, 0),
          title: const Center(
              child: Text(
            'Recipes',
            style: TextStyle(
                fontFamily: 'Comic Neue',
                fontSize: 40,
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
      body: Column(children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 550,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 255, 218, 159),
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/maggie/', (route) => false);
              },
              child: const Text(
                'Maggie',
                style: TextStyle(
                    fontFamily: 'Ingrid Darling',
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 550,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 252, 198, 113),
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/sandwich/', (route) => false);
              },
              child: const Text(
                'Sandwich',
                style: TextStyle(
                    fontFamily: 'Ingrid Darling',
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: 550,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 255, 198, 113),
          ),
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/paneer/', (route) => false);
              },
              child: const Text(
                'Paneer Pulao',
                style: TextStyle(
                    fontFamily: 'Ingrid Darling',
                    color: Colors.black,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/notes/', (route) => false);
            },
            child: const Text('Go to the Main Page'),
          ),
        ),
      ]),
    );
  }
}

class Team extends StatefulWidget {
  const Team({super.key});

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )),
          backgroundColor: const Color.fromARGB(255, 255, 187, 16),
          title: const Center(child: Text('Team')),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/notes/', (route) => false);
          },
          child: const Text('Go to the Main Page'),
        ),
      ),
    );
  }
}

class Sandwich extends StatefulWidget {
  const Sandwich({super.key});

  @override
  State<Sandwich> createState() => _SandwichState();
}

class _SandwichState extends State<Sandwich> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(500),
            child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/sandwich.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 255, 176, 48),
              title: const Center(
                  child: Text(
                'Sandwich',
                style: TextStyle(
                  fontFamily: 'Ingrid Darling',
                  fontSize: 50,
                ),
              )),
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
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontFamily: 'Ingrid Darling'),
                      children: [
                        TextSpan(
                          text: 'Ingredients :      ',
                          style: TextStyle(
                              fontFamily: 'Comic Neue',
                              fontSize: 40,
                              color: Colors.green),
                        ),
                        TextSpan(
                          text:
                              '1. Bread                 2. Butter                 3. Cheeze                 4. Cucumber                 5. Salt                   6. Pepper                 7. Tomato',
                          style: TextStyle(
                              fontFamily: 'Comic Neue',
                              fontSize: 30,
                              color: Colors.green),
                        )
                      ],
                    ),
                  ),
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

class Paneer extends StatefulWidget {
  const Paneer({super.key});

  @override
  State<Paneer> createState() => _PaneerState();
}

class _PaneerState extends State<Paneer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(500),
            child: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
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
                  image: DecorationImage(
                      image: AssetImage('assets/images/Bariyaani.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 255, 176, 48),
              title: const Center(
                  child: Text(
                '',
                style: TextStyle(
                  fontFamily: 'Ingrid Darling',
                  fontSize: 50,
                ),
              )),
            )),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 350,
                height: 420,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 176, 48),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontFamily: 'Ingrid Darling'),
                      children: [
                        TextSpan(
                          text: 'Ingredients :       ',
                          style: TextStyle(
                              fontFamily: 'Comic Neue',
                              fontSize: 40,
                              color: Colors.green),
                        ),
                        TextSpan(
                          text:
                              '1. 1 cup basmati rice               2. 200g paneer(cottage cheese),cubed                         3. 1 large onion, thinly sliced               4. 1 large tomato, chopped               5. 1/2 cup plain yogurt               6. 1/4 chopped mint leaves               7. 1/4 cup chopped coriander leaves                                   8. Two tablespoons biriyani masala                                9. One tablespoon ginger-garlic paste                                  10. 1-2 green chillies               12.1/2 tea spoon turmeric powder               13. 1/2 tea spoon red chilli powder               14. 1/2 tea spoomn garam masala               15. Whole Spices               16. Two tablespoon ghee/cooking oil               17. Salt to taste               18. Cashews or fried onions for garnish',
                          style: TextStyle(
                              fontFamily: 'Comic Neue',
                              fontSize: 20,
                              color: Colors.green),
                        )
                      ],
                    ),
                  ),
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
