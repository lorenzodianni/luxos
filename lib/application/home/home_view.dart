import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/core/core.dart';
import 'package:luxos/shared/shared.dart';

class HomeView extends StatelessWidget implements View {
  static const routerPath = '/home';

  static Handler routerHandler() {
    return Handler(handlerFunc: (
      BuildContext context,
      Map<String, dynamic> params,
    ) {
      return HomeView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LuxScaffold(
      hasBackButton: false,
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
