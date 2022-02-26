import 'package:mining_solutions/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceStorage {
  static saveDataUser(User user) async {
    final _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('token', user.token);
    await _prefs.setInt('idUser', user.idUser);
    await _prefs.setInt('typeUser', user.typeUser);
    await _prefs.setString('firstName', user.firstName);
    await _prefs.setString('lastName', user.lastName);
    await _prefs.setString('email', user.email);
    return true;
  }

  static getIdUser() async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.getInt('idUser');
  }
}
