import 'package:flutter/material.dart';
import 'package:luxos/shared/shared.dart';

class NavigationButton extends StatelessWidget {
  final IconData icon;
  final IconData active;
  final Function onTap;
  final double borderRadius;

  NavigationButton({
    this.icon,
    this.active,
    @required this.onTap,
    this.borderRadius = 56,
  });

  @override
  Widget build(BuildContext context) {
    final double activeMarkerSize = 4;

    return Stack(
      children: <Widget>[
        LuxButtonSquare(
          borderRadius: borderRadius,
          onTap: () => onTap(context),
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
