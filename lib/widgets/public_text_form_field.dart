import 'package:flutter/material.dart';

class PublicTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final Function(String)? onChange;
  final VoidCallback? onTap;
  final Function(String)? onFieldSubmitted;
  final VoidCallback? suffixPressed;
  final String? Function(String?)? validate;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? isPassword;

  const PublicTextFormField(
      {Key? key,
      this.controller,
      this.type,
      this.onChange,
      this.onTap,
      this.suffixPressed,
      this.validate,
      this.label,
      this.prefixIcon,
      this.suffixIcon,
      this.onFieldSubmitted,
      this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height/10,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: TextFormField(
          textAlign: TextAlign.start,
          controller: controller,
          keyboardType: type,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChange,
          validator: validate,
          obscureText: isPassword ?? false,
          onTap: onTap,
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(prefixIcon),
            border: const OutlineInputBorder(),
            suffix: IconButton(
              onPressed: suffixPressed,
              icon: Icon(suffixIcon),
            ),
          ),
        ),
      ),
    );
  }
}
