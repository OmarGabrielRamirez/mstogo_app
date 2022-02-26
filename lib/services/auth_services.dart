import 'package:http/http.dart' as http;
import 'package:mining_solutions/models/user.dart';
import 'dart:convert';

import 'package:mining_solutions/services/storage_services.dart';

Future<bool> signInDummy() async {
  bool _result = false;
  var _url = Uri.parse("http://awsms.syncronik.com/api/auth/login/");
  Map _body = {"email": 'omar.ramirez@hubmine.mx', "password": 'omar'};
  var _res = await http.post(_url, body: _body);
  if (_res.statusCode == 200) {
    var _jsonResponse = json.decode(_res.body);
    ServiceStorage.saveDataUser(User.fromMap(_jsonResponse));
    _result = true;
  } else if (_res.statusCode == 401) {
    _result = false;
  } else if (_res.statusCode == 500) {
    _result = false;
  }
  return _result;
}
