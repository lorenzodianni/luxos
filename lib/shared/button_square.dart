import 'package:flutter/material.dart';

class LuxButtonSquare extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final IconData icon;
  final Function onTap;
  final double size;
  final double borderRadius;

  LuxButtonSquare({
    @required this.onTap,
    this.size = 56,
    this.borderRadius = 0,
    this.backgroundColor,
    this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: this.backgroundColor ?? Theme.of(context).primaryColorLight,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: Container(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Icon(
              icon,
              color: color ?? Theme.of(context).primaryColorDark,
            ),
          ),
        ),
      ),
    );
  }
}
