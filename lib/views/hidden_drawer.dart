import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:mynotes/views/HomePage.dart';

enum MenuAction { logout, contact, recipes, aboutUs, team }

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'HomePage',
          baseStyle: TextStyle(),
          selectedStyle: TextStyle(),
        ),
        HomePage(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorMenu: Color.fromARGB(255, 245, 228, 184),
      initPositionSelected: 0,
    );
  }
}
