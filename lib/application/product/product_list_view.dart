import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:luxos/core/core.dart';
import 'package:luxos/shared/shared.dart';

class ProductListView extends StatelessWidget implements View {
  static const routerPath = '/products';

  static Handler routerHandler() {
    return Handler(handlerFunc: (
      BuildContext context,
      Map<String, dynamic> params,
    ) {
      return ProductListView();
    });
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
