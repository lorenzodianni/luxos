import 'package:flutter/material.dart';
import 'package:luxos/application/application.dart';

class ViewTitle extends StatelessWidget {
  final String title;

  ViewTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        Application.mainAxisSpacing,
        26,
        Application.mainAxisSpacing,
        16,
      ),
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
