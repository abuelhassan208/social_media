import 'package:flutter/material.dart';

class PublicMainButton extends StatelessWidget {
  final double width = double.infinity;
  final Color background = Colors.blue;
  final bool isUpperCase = true;
  final double radius = 3.0;
  final VoidCallback? function;
  final String text;

  const PublicMainButton({Key? key, this.function, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
