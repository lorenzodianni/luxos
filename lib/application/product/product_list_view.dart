import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/shared/shared.dart';
import 'package:luxos/application/application.dart';
import 'product.dart';

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
      body: CustomScrollView(
        primary: true,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: ViewTitle(title: 'Products'),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              Application.mainAxisSpacing,
              0,
              Application.mainAxisSpacing,
              Application.mainAxisSpacing,
            ),
            sliver: _productList(context),
          ),
        ],
      ),
    );
  }

  _productList(BuildContext context) {
    return FutureBuilder(
      future: productService.getProducts(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator()),
              ),
            );
            break;
          case ConnectionState.done:
            var products = snapshot.data.data;
            return SliverGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.76,
              children: List.generate(products.length, (index) {
                return _createProduct(context, products[index]);
              }),
            );
            break;
        }
      },
    );
  }

  Widget _createProduct(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Application.router.navigateTo(
          context,
          ProductDetailView.routePartial + product.id,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              product.images.first,
              fit: BoxFit.contain,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                padding: EdgeInsets.only(top: 10, bottom: 4),
              ),
              Container(
                child: Text(
                  product.id,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
