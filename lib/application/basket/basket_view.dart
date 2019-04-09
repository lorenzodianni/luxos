import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/shared/shared.dart';

class BasketView extends StatelessWidget {
  static const routerPath = '/basket';

  static Handler routerHandler() {
    return Handler(handlerFunc: (
      BuildContext context,
      Map<String, dynamic> params,
    ) {
      return BasketView();
    });
  }

  static defineRoute(Router router) {
    router.define(
      BasketView.routerPath,
      handler: BasketView.routerHandler(),
      transitionType: TransitionType.native,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LuxScaffold(
      body: Column(
        children: <Widget>[
          ViewTitle(title: 'Basket'),
        ],
      ),
    );
  }
}
