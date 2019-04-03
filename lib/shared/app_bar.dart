import 'package:flutter/material.dart';

class LuxAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> children;
  final String borderPosition;

  static String borderTop = 'top';
  static String borderBottom = 'bottom';

  LuxAppBar({this.children, this.borderPosition});

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight + 0.0);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          border: _createBorder(),
          color: Theme.of(context).primaryColorLight,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: children,
        ),
      ),
    );
  }

  Border _createBorder() {
    if (borderPosition is String) {
      return borderPosition == LuxAppBar.borderBottom
          ? Border(bottom: _createBorderSide())
          : Border(top: _createBorderSide());
    }
    return null;
  }

  BorderSide _createBorderSide() {
    return BorderSide(color: Colors.grey.shade200);
  }
}
