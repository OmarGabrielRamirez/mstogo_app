import 'package:flutter/material.dart';

class InputTexts extends StatelessWidget {
  final Color? color;
  final int? minLines;
  final int? maxLines;
  final Icon? icon;
  final String? label;

  const InputTexts(
      {Key? key,
      this.color,
      this.minLines,
      this.maxLines,
      this.icon,
      this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
          style: TextStyle(color: color),
          minLines: minLines,
          maxLines: maxLines,
          decoration: InputDecoration(
              suffixIcon: icon == null ? null : icon,
              labelText: label,
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))))),
    );
  }
}
