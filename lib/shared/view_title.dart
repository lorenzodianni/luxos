import 'package:flutter/material.dart';

class ViewTitle extends StatelessWidget {
  final String title;

  ViewTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 26, 10, 16),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
    );
  }
}
