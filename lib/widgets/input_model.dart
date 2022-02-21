import 'package:flutter/material.dart';
import 'package:mining_solutions/providers/verification_code_info.dart';
import 'package:mining_solutions/theme.dart';

import 'package:provider/provider.dart';

class Input extends StatelessWidget {
  final Color? color;
  final Icon? icon;
  final Icon? prefixIcon;
  final String? label;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const Input({
    Key? key,
    this.color,
    this.icon,
    this.prefixIcon,
    this.label,
    this.hintText,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        minLines: 1, //Normal textInputField will be displayed
        maxLines: 5,
        controller: controller,
        keyboardType: keyboardType,
        style: bodyTextStyle,
        autocorrect: false,
        decoration: InputDecoration(
          label: Text("${label}", style: inputLabelTextStyle),
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.black26),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(10.0),
            borderSide: BorderSide(color: secondaryClr),
          ),
        ));
  }
}
//icon == null ? null : icon

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  const PasswordField({Key? key, this.controller}) : super(key: key);

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
      controller: this.widget.controller,
      autocorrect: false,
      decoration: InputDecoration(
        label: Text("Contraseña", style: inputLabelTextStyle),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          borderSide: BorderSide(color: secondaryClr),
        ),
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

// Country Field Input
class CountryField extends StatefulWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const CountryField({Key? key, this.keyboardType, this.controller})
      : super(key: key);

  @override
  State<CountryField> createState() => _CountryFieldState();
}

class _CountryFieldState extends State<CountryField> {
  String? _selectedCountryCode;
  List<String> _countryCodes = ['+52', '+57'];

  initState() {
    _selectedCountryCode = _countryCodes[0];
  }

  @override
  Widget build(BuildContext context) {
    final phoneOTP = Provider.of<VerificationCodeInfo>(context);

    var countryDropDown = Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      height: 45.0,
      margin: const EdgeInsets.all(3.0),
      //width: 300.0,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            value: _selectedCountryCode,
            items: _countryCodes.map((String value) {
              return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(
                    value,
                    style: TextStyle(fontSize: 16.0),
                  ));
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCountryCode = value as String;
                phoneOTP.countryCode = _selectedCountryCode as String;
              });
            },
          ),
        ),
      ),
    );
    return TextFormField(
        controller: widget.controller,
        validator: (String? value) {
          if (value != null && value.isEmpty) {
            return "Por favor ingrese su número";
          }
          return null;
        },
        keyboardType: widget.keyboardType,
        style: bodyTextStyle,
        autocorrect: false,
        decoration: InputDecoration(
            prefixIcon: countryDropDown,
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: secondaryClr, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)))));
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  final Color? color;
  final Icon? icon;
  final String? label;
  final String? hintText;
  final TextInputType? keyboardType;

  const SearchInput({
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
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        hintText: hintText,
        suffixIcon: icon == null ? null : icon,
        labelText: label,
        labelStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: new BorderRadius.circular(10.0),
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }
}

/* class DropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T? value;
  final String Function(T)? getLabel;
  final void Function(T?)? onChanged;


  const DropdownInput({
    this.hintText = 'Please select an Option',
    this.options = const [],
    this.getLabel,
    this.value,
    this.onChanged,
  });


  


  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      builder: (FormFieldState<T> state) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            labelText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
          isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              value: value!= null ? value,
              isDense: true,
              onChanged: onChanged,
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(getLabel!(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
} */
