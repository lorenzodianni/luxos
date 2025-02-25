import 'package:flutter/material.dart';
import 'package:luxos/application/application.dart';

class LuxDrawer extends StatelessWidget {
  final List<Map<String, dynamic>> menu = [
    {
      'text': 'Home',
      'onTap': (BuildContext context) {
        Application.router.navigateTo(
          context,
          HomeView.routePath,
          clearStack: true,
        );
      },
    },
    {
      'text': 'Products',
      'onTap': (BuildContext context) {
        Application.router.navigateTo(context, ProductListView.routePath);
      },
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.grey.shade400,
            height: 0,
          );
        },
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(menu[index]['text']),
            onTap: () {
              Navigator.pop(context);
              menu[index]['onTap'](context);
            },
          );
        },
      ),
    );
  }
}
