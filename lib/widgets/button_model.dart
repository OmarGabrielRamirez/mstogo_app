import 'package:flutter/material.dart';

class ButtonStyles extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final RoundedRectangleBorder? border;
  const ButtonStyles({Key? key, this.child, this.color, this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialButton(
          onPressed: () {}, color: color, shape: border, child: child),
    );
  }
}
