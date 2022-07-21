

import 'package:flutter/material.dart';

class PublicStringButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PublicStringButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text.toUpperCase()),
    );
  }
}
