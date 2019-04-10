import 'package:flutter/material.dart';
import 'product.dart';
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
      body: _loadProduct(),
    );
  }

  _loadProduct() {
    return FutureBuilder(
      future: productService.getProduct(id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: CircularProgressIndicator()),
            );
            break;
          case ConnectionState.done:
            return _buildPage(snapshot.data);
            break;
        }
      },
    );
  }

  _buildPage(Product product) {
    return CustomScrollView(
      primary: true,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: ViewTitle(title: product.name),
        ),
//        SliverPadding(
//          padding: EdgeInsets.fromLTRB(
//            Application.mainAxisSpacing,
//            0,
//            Application.mainAxisSpacing,
//            Application.mainAxisSpacing,
//          ),
//          sliver: _productList(context),
//        ),
      ],
    );
  }
}
