import 'package:flutter/material.dart';
import 'package:luxos/shared/shared.dart';

class LuxScaffold extends StatelessWidget {
  final bool hasBackButton;
  final IconData activeRoute;
  final Widget body;

  LuxScaffold({this.hasBackButton = true, this.activeRoute, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LuxAppBar(
        back: hasBackButton,
        activeRoute: activeRoute,
      ),
      drawer: LuxDrawer(),
      body: body,
    );
  }
}
