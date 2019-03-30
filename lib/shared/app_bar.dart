import 'package:flutter/material.dart';
import 'package:luxos/application/application.dart';
import 'package:luxos/shared/shared.dart';

class LuxAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool back;

  LuxAppBar({this.back = true});

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
            LuxButtonSquare(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              backgroundColor: Theme.of(context).primaryColorDark,
              color: Theme.of(context).primaryColorLight,
              icon: Icons.menu,
            ),
            back
                ? LuxButtonSquare(
                    onTap: () {
                      Application.router.pop(context);
                    },
                    borderRadius: 56,
                    icon: Icons.arrow_back_ios,
                  )
                : Container(),
            Expanded(child: Container()),
            LuxButtonSquare(
              borderRadius: 56,
              onTap: () {},
              icon: Icons.receipt,
            ),
            LuxButtonSquare(
              borderRadius: 56,
              onTap: () {},
              icon: Icons.group,
            ),
            LuxButtonSquare(
              borderRadius: 56,
              onTap: () {},
              icon: Icons.favorite_border,
            ),
            LuxButtonSquare(
              borderRadius: 56,
              onTap: () {},
              icon: Icons.shopping_cart,
            ),
          ],
        ),
      ),
    );
  }
}
