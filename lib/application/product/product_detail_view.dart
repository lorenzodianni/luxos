import 'package:flutter/material.dart';
import 'package:luxos/core/core.dart';
import 'package:luxos/shared/shared.dart';

class ProductDetailView extends StatelessWidget {
  static const routePartial = '/product/';
  static const routePath = ProductDetailView.routePartial + ':id';

  static Handler routerHandler() {
    return Handler(handlerFunc: (
      BuildContext context,
      Map<String, dynamic> params,
    ) {
      return ProductDetailView(params['id'][0]);
    });
  }

  static defineRoute(Router router) {
    router.define(
      ProductDetailView.routePath,
      handler: ProductDetailView.routerHandler(),
      transitionType: TransitionType.native,
    );
  }

  final String id;

  ProductDetailView(this.id);

  @override
  Widget build(BuildContext context) {
    return LuxScaffold(
      body: Column(
        children: <Widget>[
          ViewTitle(title: 'Product $id'),
        ],
      ),
    );
  }
}
