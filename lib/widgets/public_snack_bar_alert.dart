import 'package:flutter/material.dart';

void publicSnackBarAlert({dynamic context, required String text, Duration? duration}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      content: Text(
        text,
        textAlign: TextAlign.end,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      behavior: SnackBarBehavior.fixed,
      duration: duration ?? const Duration(seconds: 10),
    ),
  );
}
