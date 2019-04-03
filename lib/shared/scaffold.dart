import 'package:flutter/material.dart';
import 'package:luxos/shared/shared.dart';
import 'package:luxos/application/application.dart';

class LuxScaffold extends StatelessWidget {
  final bool hasBackButton;
  final IconData activeRoute;
  final Widget body;

  LuxScaffold({this.hasBackButton = true, this.activeRoute, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appHeader(),
      drawer: LuxDrawer(),
      body: body,
      bottomNavigationBar: _appFooter(),
    );
  }

  Widget _appHeader() {
    return LuxAppBar(
      borderPosition: LuxAppBar.borderBottom,
      children: <Widget>[
        NavigationMenuButton(onTap: (BuildContext context) {
          Scaffold.of(context).openDrawer();
        }),
        NavigationBackButton(visible: hasBackButton),
        Expanded(child: Container()),
        NavigationButton(
          icon: Icons.receipt,
          active: activeRoute,
          onTap: (BuildContext context) {},
        ),
        NavigationButton(
          icon: Icons.person_outline,
          active: activeRoute,
          onTap: (BuildContext context) {},
        ),
        NavigationButton(
          icon: Icons.favorite_border,
          active: activeRoute,
          onTap: (BuildContext context) {},
        ),
        NavigationButton(
          icon: Icons.shopping_cart,
          active: activeRoute,
          onTap: (BuildContext context) {
            Application.router.navigateTo(context, BasketView.routerPath);
          },
        ),
      ],
    );
  }

  Widget _appFooter() {
    return LuxAppBar(
      borderPosition: LuxAppBar.borderTop,
      children: <Widget>[
        NavigationButton(
          icon: Icons.search,
          active: activeRoute,
          onTap: (BuildContext context) {},
        ),
        NavigationButton(
          icon: Icons.crop_free,
          active: activeRoute,
          onTap: (BuildContext context) {},
        ),
        NavigationButton(
          icon: Icons.group,
          active: activeRoute,
          onTap: (BuildContext context) {},
        ),
        NavigationButton(
          icon: Icons.more_horiz,
          active: activeRoute,
          onTap: (BuildContext context) {},
        ),
      ],
    );
  }
}
