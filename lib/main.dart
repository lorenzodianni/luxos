import 'package:flutter/material.dart';
import 'package:luxos/application/application.dart';

void main() => runApp(Luxos());

class Luxos extends StatelessWidget {
  Luxos() {
    Application.configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      theme: ThemeData(
        primaryColorLight: Colors.grey.shade50,
        primaryColorDark: Colors.black,
        primarySwatch: Colors.grey,
        accentColor: Colors.yellow,
      ),
      home: HomeView(),
    );
  }
}
