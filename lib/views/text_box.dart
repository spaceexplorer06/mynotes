import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text;
  final String SectionName;
  final void Function()? onPressed;
  const MyTextBox(
      {super.key,
      required this.text,
      required this.SectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(SectionName, style: TextStyle(color: Colors.black)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
                )),
          ],
        ),
        Text(text),
      ]),
    );
  }
}
