import 'package:flutter/material.dart';
import 'package:luxos/shared/shared.dart';

class NavigationMenuButton extends StatelessWidget {
  final bool visible;
  final Function onTap;

  NavigationMenuButton({this.visible, this.onTap});

  @override
  Widget build(BuildContext context) {
    return LuxButtonSquare(
      icon: Icons.menu,
      onTap: () => onTap(context),
      color: Theme.of(context).primaryColorLight,
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}
