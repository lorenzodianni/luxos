import 'package:flutter/material.dart';
import 'package:luxos/auth/auth_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorLight: Colors.grey.shade50,
        primaryColorDark: Colors.black,
        primarySwatch: Colors.grey,
        accentColor: Colors.yellow,
      ),
      home: AuthView(),
    );
  }
}
