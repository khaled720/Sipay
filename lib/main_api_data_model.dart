import 'dart:convert';

class MainApiModel {
  int statusCode;
  String description;
  var data;

  MainApiModel(statusCode, description, data) {
    print(">>>>>>>>>>>>>desc>>>> "+description);
    this.statusCode = statusCode;
    this.description = description;
    this.data = data;
  }

  static MainApiModel mapJsonToModel(String json) {
    print("Json>>>> "+ json.toString());
    var decodedJson = jsonDecode(json);

    var code =int.parse(decodedJson["statuscode"].toString());
    return MainApiModel(code, decodedJson["description"], decodedJson['data']);
  }
}
