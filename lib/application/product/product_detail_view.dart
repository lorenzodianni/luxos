import 'package:flutter/material.dart';
import 'package:luxos/application/application.dart';
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
      body: _loadProduct(context),
    );
  }

  _loadProduct(BuildContext context) {
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
            return _buildPage(context, snapshot.data);
            break;
        }
      },
    );
  }

  _buildPage(BuildContext context, Product product) {
    var size = MediaQuery.of(context).size;
    return CustomScrollView(
      primary: true,
      slivers: <Widget>[
        SliverAppBar(
          title: Text(
            product.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: <Widget>[
            LuxButtonSquare(
              onTap: () {},
              icon: Icons.favorite_border,
              borderRadius: 50,
              backgroundColor: Colors.white.withOpacity(0),
            )
          ],
          expandedHeight: size.width,
          backgroundColor: Theme.of(context).primaryColorLight,
          flexibleSpace: FlexibleSpaceBar(
            background: Hero(
              tag: 'img-' + product.id,
              child: Stack(
                children: <Widget>[
                  Image.network(
                    product.images.first,
                    height: size.width,
                    width: size.width,
                    fit: BoxFit.contain,
                  ),
                  Container(
                    height: size.width,
                    width: size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.1, 0.25],
                        colors: [
                          Colors.white.withOpacity(1),
                          Colors.white.withOpacity(0.0)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(Application.mainAxisSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      product.id,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '1000,00 €',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 600,
                child: Placeholder(),
              ),
            ],
          ),
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
