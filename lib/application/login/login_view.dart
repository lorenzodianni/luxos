import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/application/application.dart';
import 'package:luxos/shared/shared.dart';

class LoginView extends StatelessWidget {
  static const routerPath = '/login';

  static Handler routerHandler() {
    return Handler(handlerFunc: (BuildContext context,
        Map<String, dynamic> params,) {
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _createHeroImage('assets/img/hero_welcome.jpg'),
          _createCenteredContainer(
            child: _createForm(),
          ),
        ],
      ),
    );
  }

  Widget _createHeroImage(String url) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(url),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _createCenteredContainer({Widget child}) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: child,
          ),
        ],
      ),
    );
  }

  Form _createForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LuxInput(
            placeholder: 'Email',
            validator: (value) {
              return value.isEmpty ? 'Email is required' : null;
            },
          ),
          LuxInput(
            placeholder: 'Password',
            obscureText: true,
            validator: (value) {
              return value.isEmpty ? 'Password is required' : null;
            },
          ),
          LuxButton(
            margin: EdgeInsets.only(top: 6),
            text: Text('Login'),
            onTap: _shouldLogin,
          ),
        ],
      ),
    );
  }

  _shouldLogin(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Application.router.navigateTo(
        context,
        HomeView.routePath,
        clearStack: true,
        transition: TransitionType.nativeModal,
      );
    }
  }
}
