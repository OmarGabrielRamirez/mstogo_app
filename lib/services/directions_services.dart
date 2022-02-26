import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mining_solutions/services/storage_services.dart';
import '../models/location_data.dart';

class ServiceDirections {
  static fetchDirectionsAll() async {
    int _id = await ServiceStorage.getIdUser();
    final _response = await http.get(Uri.parse(
        'http://awsms.syncronik.com/api/locations/details/' + _id.toString()));

    if (_response.statusCode == 200) {
      final _dataResult = json.decode(_response.body);
      final data = _dataResult['locations'].cast<Map<String, dynamic>>();
      return data
          .map<LocationData>((json) => LocationData.fromMap(json))
          .toList();
    } else {
      throw Exception('Failed to load data for directions');
    }
  }

  static saveDirection(LocationData data) async {
    bool _result = false;
    int _id = await ServiceStorage.getIdUser();
    var _url = Uri.parse("http://awsms.syncronik.com/api/locations/create/" +
        _id.toString() +
        "/");

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var _res = await http.post(
      _url,
      body: data.toJson(),
      headers: requestHeaders,
    );

    if (_res.statusCode == 201) {
      _result = true;
    } else if (_res.statusCode == 401) {
      _result = false;
    } else if (_res.statusCode == 500) {
      _result = false;
    }
    return _result;
  }
}
