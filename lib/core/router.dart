import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

export 'package:fluro/fluro.dart';

class LuxRouter extends Router {
  final List<String> stack = [];

  LuxRouter() : super();

  @override
  Future navigateTo(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    TransitionType transition,
    Duration transitionDuration = const Duration(milliseconds: 250),
    RouteTransitionsBuilder transitionBuilder,
  }) {
    if (stack.isNotEmpty && stack.last == path) {
      return Future.value('same view');
    }

    if (stack.isNotEmpty && replace) {
      stack.last = path;
    } else {
      if (stack.isNotEmpty && clearStack) {
        stack.clear();
      }
      stack.add(path);
    }

    super.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
    );
  }

  @override
  bool pop(BuildContext context) {
    stack.removeLast();
    return super.pop(context);
  }
}
