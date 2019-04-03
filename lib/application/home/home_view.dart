import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/shared/shared.dart';

class HomeView extends StatelessWidget {
  static const routePath = '/home';

  static Handler routerHandler() {
    return Handler(handlerFunc: (
      BuildContext context,
      Map<String, dynamic> params,
    ) {
      return HomeView();
    });
  }

  static defineRoute(Router router) {
    router.define(
      HomeView.routePath,
      handler: HomeView.routerHandler(),
      transitionType: TransitionType.native,
    );
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
