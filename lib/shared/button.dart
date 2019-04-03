import 'package:flutter/material.dart';

class LuxButton extends StatelessWidget {
  final Function onTap;
  final double width;
  final double borderRadius;
  final Color backgroundColor;
  final Color color;
  final IconData icon;
  final Text text;

  LuxButton({
    @required this.onTap,
    this.width,
    this.borderRadius = 0,
    this.backgroundColor,
    this.color,
    this.icon,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          text,
        ],
      ),
      onPressed: () => onTap(context),
      color: Theme.of(context).accentColor,
    );
  }
}
