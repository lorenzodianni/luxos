import 'package:flutter/material.dart';
import 'package:luxos/shared/shared.dart';

class AuthView extends StatelessWidget {
  AuthView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LuxAppBar(),
      body: Container(
        child: Text('Auth View'),
      ),
    );
  }
}
