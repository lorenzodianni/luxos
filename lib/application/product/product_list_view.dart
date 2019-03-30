import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/shared/shared.dart';

class ProductListView extends StatelessWidget {
  static const routerPath = '/products';

  static routerHandler() {
    return Handler(handlerFunc: (
      BuildContext context,
      Map<String, dynamic> params,
    ) {
      return ProductListView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LuxAppBar(),
      drawer: LuxDrawer(),
      body: Center(
        child: Text('ProductListView'),
      ),
    );
  }
}
