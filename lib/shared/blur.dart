import 'dart:ui';
import 'package:flutter/material.dart';

class LuxBlur extends StatelessWidget {
  final double sigma;
  final Widget child;
  final EdgeInsets margin;
  final double borderRadius;
  final Color color;

  LuxBlur({
    this.sigma = 10.0,
    this.child,
    this.margin,
    this.borderRadius = 12,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
      child: Container(
        margin: margin,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color ?? Theme.of(context).primaryColorLight.withOpacity(0.1),
        ),
        child: child,
      ),
    );
  }
}
