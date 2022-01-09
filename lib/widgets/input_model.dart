import 'package:flutter/material.dart';
import 'package:mining_solutions/theme.dart';

class Input extends StatelessWidget {
  final Color? color;
  final Icon? icon;
  final String? label;
  final String? hintText;
  final TextInputType? keyboardType;

  const Input({
    Key? key,
    this.color,
    this.icon,
    this.label,
    this.hintText,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        style: bodyTextStyle,
        autocorrect: false,
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: icon == null ? null : icon,
            labelText: label,
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)))));
  }
}
//icon == null ? null : icon

class PasswordField extends StatefulWidget {
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  bool _obscureText = true;
  bool _password = true;
  Widget build(BuildContext context) {
    void _toggle() {
      setState(() {
        _obscureText = !_obscureText;
      });
      void _showPassword() {
        setState(() {
          _password = !_password;
        });
      }
    }

    return TextFormField(
      obscureText: _obscureText,
      style: bodyTextStyle,
      autocorrect: false,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        suffixIcon: GestureDetector(
          onTap: () {
            _toggle();
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
