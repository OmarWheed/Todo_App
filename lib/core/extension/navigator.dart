import 'package:flutter/material.dart';

extension NavigatorContext on BuildContext {
  //
  void pop() {
    return Navigator.of(this).pop();
  }

  //push name
  Future pushNamed(String routeName,
      {Map<String, dynamic> arguments = const {}}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }
  //push name and replacement
  Future pushReplacementNamed(String routeName,
      {Map<String, dynamic> arguments = const {}}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }
}
