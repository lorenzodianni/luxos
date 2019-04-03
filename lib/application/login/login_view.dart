import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/application/application.dart';
import 'package:luxos/core/core.dart';
import 'package:luxos/shared/shared.dart';

class LoginView extends StatelessWidget implements View {
  static const routerPath = '/login';

  static Handler routerHandler() {
    return Handler(handlerFunc: (
      BuildContext context,
      Map<String, dynamic> params,
    ) {
      return LoginView();
    });
  }

  static defineRoute(Router router) {
    router.define(
      LoginView.routerPath,
      handler: LoginView.routerHandler(),
      transitionType: TransitionType.native,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: LuxButton(
            text: Text('Login'),
            onTap: (BuildContext context) {
              Application.router.navigateTo(
                context,
                HomeView.routePath,
                clearStack: true,
                transition: TransitionType.nativeModal
              );
            },
          ),
        ),
      ),
    );
  }
}
