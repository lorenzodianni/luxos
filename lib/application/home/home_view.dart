import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/shared/shared.dart';

class HomeView extends StatelessWidget {
  static const routerPath = '/home';

  static routerHandler() {
    return Handler(handlerFunc: (
      BuildContext context,
      Map<String, dynamic> params,
    ) {
      return HomeView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LuxAppBar(back: false),
      drawer: LuxDrawer(),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
