import 'package:flutter/material.dart';

import '../theme.dart';

class Button extends StatelessWidget {
  final Color? color;
  final Text? text;
  final double? width;
  final double? height;
  final action;
  const Button({
    Key? key,
    this.color,
    this.text,
    this.width,
    this.height,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialButton(
        elevation: 0,
        onPressed: () {
          action();
        },
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: width,
          height: height,
          child: Center(
            child: text,
          ),
        ),
      ),
    );
  }
}
