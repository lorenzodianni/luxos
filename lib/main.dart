import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:luxos/application/application.dart';
import 'package:luxos/core/core.dart';

_parseAndDecode(String response) => jsonDecode(response);

parseJson(String text) => compute(_parseAndDecode, text);

void main() {
  // httpClient.interceptors
  (httpClient.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  httpClient.options.receiveTimeout = 10000;

  runApp(Luxos());
}

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
      home: AuthView(),
    );
  }
}
