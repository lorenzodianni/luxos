import 'package:flutter/material.dart';
import 'package:luxos/application/application.dart';
import 'package:luxos/shared/shared.dart';

class LuxAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool back;
  final IconData activeRoute;

  LuxAppBar({this.back = true, this.activeRoute});

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight + 0.0);

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
      ),
      child: SafeArea(
        child: Row(
          children: <Widget>[
            NavigationMenuButton(),
            NavigationBackButton(visible: back),
            Expanded(child: Container()),
            NavigationButton(
              icon: Icons.receipt,
              active: activeRoute,
              onTap: () {},
            ),
            NavigationButton(
              icon: Icons.group,
              active: activeRoute,
              onTap: () {},
            ),
            NavigationButton(
              icon: Icons.favorite_border,
              active: activeRoute,
              onTap: () {},
            ),
            NavigationButton(
              icon: Icons.shopping_cart,
              active: activeRoute,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final IconData active;
  final Function onTap;
  final double borderRadius;

  NavigationButton({
    this.icon,
    this.active,
    this.onTap,
    this.borderRadius = 56,
  });

  @override
  Widget build(BuildContext context) {
    final double activeMarkerSize = 4;

    return Stack(
      children: <Widget>[
        LuxButtonSquare(
          borderRadius: borderRadius,
          onTap: onTap,
          icon: icon,
        ),
        Positioned(
          bottom: 6,
          left: (56 / 2) - (activeMarkerSize / 2),
          child: icon == active
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(activeMarkerSize),
                    ),
                  ),
                  height: activeMarkerSize,
                  width: activeMarkerSize,
                )
              : Container(),
        ),
      ],
    );
  }
}

class NavigationBackButton extends StatelessWidget {
  final bool visible;

  NavigationBackButton({this.visible});

  @override
  Widget build(BuildContext context) {
    return visible
        ? NavigationButton(
            icon: Icons.arrow_back_ios,
            onTap: () => Application.router.pop(context),
          )
        : Container();
  }
}

class NavigationMenuButton extends StatelessWidget {
  final bool visible;

  NavigationMenuButton({this.visible});

  @override
  Widget build(BuildContext context) {
    return LuxButtonSquare(
      icon: Icons.menu,
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      color: Theme.of(context).primaryColorLight,
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}
