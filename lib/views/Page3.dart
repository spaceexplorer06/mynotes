import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/views/HomePage.dart';
import 'package:mynotes/views/text_box.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

enum MenuAction { logout, contact, recipes, aboutUs, team }

class _Page3State extends State<Page3> {
  // user
  final currentUser = FirebaseAuth.instance.currentUser!;
  // edit field
  Future<void> editField(String field) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 220, 165),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
                backgroundColor: const Color.fromARGB(255, 242, 220, 165),
                title: Center(
                  child: Text(
                    'Profile',
                    style: GoogleFonts.aclonica(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                actions: [
                  PopupMenuButton<MenuAction>(
                    shadowColor: const Color.fromARGB(255, 5, 1, 1),
                    elevation: 20,
                    color: const Color.fromARGB(255, 208, 204, 197),
                    onSelected: (value) async {
                      switch (value) {
                        case MenuAction.logout:
                          final shouldLogout = await showlogoutDialog(context);
                          if (shouldLogout) {
                            await FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/login/', (_) => false);
                          }
                          break;
                        case MenuAction.contact:
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/contact/', (route) => false);
                          break;
                        case MenuAction.recipes:
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/recipes/', (route) => false);
                          break;
                        case MenuAction.aboutUs:
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/aboutus/', (route) => false);
                          break;
                        case MenuAction.team:
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              '/team/', (route) => false);
                          break;
                      }
                    },
                    itemBuilder: (context) {
                      return const [
                        PopupMenuItem<MenuAction>(
                          value: MenuAction.recipes,
                          child: Text('Recipes'),
                        ),
                        PopupMenuItem<MenuAction>(
                          value: MenuAction.aboutUs,
                          child: Text('About Us'),
                        ),
                        PopupMenuItem<MenuAction>(
                            value: MenuAction.contact,
                            child: Text('Contact Us')),
                        PopupMenuItem<MenuAction>(
                            value: MenuAction.team, child: Text('Team')),
                        PopupMenuItem<MenuAction>(
                          value: MenuAction.logout,
                          child: Text('Logout'),
                        ),
                      ];
                    },
                  )
                ])),
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            // Profile Pic
            const Icon(Icons.person, size: 72),
            // user email
            Container(
              margin: const EdgeInsets.all(20),
              child: Text(
                currentUser.email!,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            //user details
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'My Details',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            // username
            MyTextBox(
              text: 'Name',
              SectionName: 'Username',
              onPressed: () => editField('username'),
            ),
            // Bio
            MyTextBox(
              text: 'Empty Bio',
              SectionName: 'Bio',
              onPressed: () => editField('Bio'),
            ),
            const SizedBox(height: 50),
            // user Posts
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'My Posts',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ));
  }
}
