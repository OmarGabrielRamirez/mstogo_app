import 'package:flutter/material.dart';

class RegisterInfo extends ChangeNotifier {
  String _name = "";
  String get name => this._name;

  set name(String value) => this._name = value;
  String _lastName = "";
  String get lastName => this._lastName;

  set lastName(String value) => this._lastName = value;
  String _email = "";
  String get email => this._email;

  set email(String value) => this._email = value;
  String _password = "";
  String get password => this._password;

  set password(String value) => this._password = value;
  String _businessName = "";
  String get businessName => this._businessName;

  set businessName(String value) => this._businessName = value;
  String _businessType = "";

  String get businessType => this._businessType;

  set businessType(String value) => this._businessType = value;
  String _rfc = "";
  String get rfc => this._rfc;

  set rfc(String value) => this._rfc = value;
}
