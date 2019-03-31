import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/core/core.dart';
import 'package:luxos/shared/shared.dart';

class BasketView extends StatelessWidget implements View {
  static const routerPath = '/basket';

  static Handler routerHandler() {
    return Handler(handlerFunc: (
      BuildContext context,
      Map<String, dynamic> params,
    ) {
      return BasketView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LuxScaffold(
      body: Center(
        child: Text('Basket'),
      ),
    );
  }
}
