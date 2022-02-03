import 'package:http/http.dart' as http;
import 'dart:convert';

Future<bool> signInDummy() async {
  bool _result = false;
  var _email = 'omar.ramirez@syncronik.com';
  var _password = 'omar123456789';
  var _url = Uri.parse("http://awsms.syncronik.com/api/auth/login/");
  Map _body = {"email": _email, "password": _password};
  var _res = await http.post(_url, body: _body);
  if (_res.statusCode == 200) {
    var _jsonResponse = json.decode(_res.body);
    _result = true;
  } else if (_res.statusCode == 401) {
    _result = false;
  } else if (_res.statusCode == 500) {
    _result = false;
  }
  return _result;
}
