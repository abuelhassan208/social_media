import 'package:flutter/material.dart';

class Navigation {
  static pushReplacement(context, route) => Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => route));

  static push(context, route) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => route));

  static pushAndRemoveUntil(context, pageRoute) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => pageRoute),
      (route) => false);

  static pop(context) => Navigator.pop(context);
}
