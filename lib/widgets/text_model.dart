import 'package:flutter/material.dart';

class InputTexts extends StatelessWidget {
  final Color? color;
  final Icon? icon;
  final String? label;
  final String? hintText;
  final bool? obscureText;

  const InputTexts(
      {Key? key,
      this.color,
      this.icon,
      this.label,
      this.hintText,
      this.obscureText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(color: color),
        obscureText: obscureText as bool,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: icon == null ? null : icon,
            labelText: label,
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)))));
  }
}
