import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/shared/shared.dart';

class ProductListView extends StatelessWidget {
  static const routePath = '/products';

  static Handler routerHandler() {
    return Handler(handlerFunc: (
      BuildContext context,
      Map<String, dynamic> params,
    ) {
      return ProductListView();
    });
  }

  static defineRoute(Router router) {
    router.define(
      ProductListView.routePath,
      handler: ProductListView.routerHandler(),
      transitionType: TransitionType.native,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LuxScaffold(
      body: Center(
        child: Text('ProductListView'),
      ),
    );
  }
}
