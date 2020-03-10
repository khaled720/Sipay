import 'dart:convert';

class LoginModel {
  int statusCode;
  String description;
  var data;

  LoginModel(statusCode, description, data) {
    this.statusCode = statusCode;
    this.description = description;
    this.data = data;
  }

  static LoginModel mapJsonToModel(String json) {
    var decodedJson = jsonDecode(json);
    int code = decodedJson["statuscode"];
    return LoginModel(code, decodedJson["description"], decodedJson['data']);
  }
}
