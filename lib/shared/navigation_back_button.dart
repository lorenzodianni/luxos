import 'package:flutter/material.dart';
import 'package:luxos/shared/shared.dart';
import 'package:luxos/application/application.dart';

class NavigationBackButton extends StatelessWidget {
  final bool visible;

  NavigationBackButton({this.visible});

  @override
  Widget build(BuildContext context) {
    return visible
        ? NavigationButton(
            icon: Icons.arrow_back_ios,
            onTap: (context) => Application.router.pop(context),
          )
        : Container();
  }
}
