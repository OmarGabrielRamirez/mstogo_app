import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class ButtonStyles extends StatelessWidget {
  final Widget? child;
  const ButtonStyles({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: child),
    );
  }
}
