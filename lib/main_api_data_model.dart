import 'dart:convert';

class MainApiModel {
  int statusCode;
  String description;
  var data;

  MainApiModel(statusCode, description, data) {
    this.statusCode = statusCode;
    this.description = description;
    this.data = data;
  }

  static MainApiModel mapJsonToModel(String json) {
    var decodedJson = jsonDecode(json);
    var code = decodedJson["statuscode"];
    return MainApiModel(code, decodedJson["description"], decodedJson['data']);
  }
}
