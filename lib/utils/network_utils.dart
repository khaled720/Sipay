import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class NetworkHelper {
  static Future<String> uploadBase64Image(
      var endPoint, File file, var bearerToken) async {
    if (file == null) return '';
    String base64Image =
        'data:image/png;base64,' + base64Encode(file.readAsBytesSync());
    String fileName = file.path.split("/").last;
    // make POST Request
    Response response;
    String body = "";
    try {
      print("@# "+bearerToken);
      var request = {
        'Content-type': 'application/x-www-form-urlencoded',
        HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
      };
      response =
          await post(endPoint, body: {'image': base64Image}, headers: request);
      int statusCode = response
          .statusCode; // this API passes back the id of the new item added to the body
      if (statusCode == 200) { print("##@@###"+statusCode.toString());
        body = response.body;
      }
    } // request
    catch (e) {

print("E = "+e.toString() );

    }
    print("ssssssss "+body);
    // check the status code for the result
    return body;
  }

  static Future<String> makePostRequestJsonHeaders(
      var endPoint, dynamic postValues, var bearerToken) async {
    // make POST Request
    Response response;
    String body = "";
    try {
      Map<String, String> request = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
      };
      response = await post(endPoint, body: postValues, headers: request);
      int statusCode = response
          .statusCode; // this API passes back the id of the new item added to the body
      if (statusCode == 200) {
        body = response.body;
      }
    } // request
    catch (e) {}
    // check the status code for the result
    return body;
  }

  static Future<String> makePostRequest(
      var endPoint, dynamic postValues, var bearerToken) async {
    // make POST Request
    Response response;
    String body = "";
    try {
      Map<String, String> request = {
        'Content-type': 'application/x-www-form-urlencoded',
      };
      if (bearerToken != null) {
        request = {
          'Content-type': 'application/x-www-form-urlencoded',
          HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
        };
      }
      response = await post(endPoint, body: postValues, headers: request);
      int statusCode = response
          .statusCode; // this API passes back the id of the new item added to the body
      if (statusCode == 200) {
        body = response.body;
      }
    } // request
    catch (e) {}
    // check the status code for the result
    return body;
  }


  static Future<String> makePostRequest2(
      var endPoint, dynamic postValues, var bearerToken) async {
    // make POST Request
    Response response;
    String body = "";
    try {
      Map<String, String> request = {
  //      'Content-type': 'application/json',
      };
      if (bearerToken != null) {
        request = {
       //   'Content-type': 'application/json',
          'Accept':'application/json',
          "Authorization": 'Bearer $bearerToken'
        };
      }
      response = await post(endPoint, body: postValues, headers: request);
      int statusCode = response
          .statusCode;
          print("Response edit bank acount: =>> "+response.body);
           // this API passes back the id of the new item added to the body
      if (statusCode == 200) {
        body = response.body;
      }
    } // request
    catch (e) {}
    // check the status code for the result
    return body;
  }
  static Future<String> makeGetRequest(var endPoint, var bearerToken) async {
    // set up Get request arguments
    Response response;
    String body = "";
    try {
      Map<String, String> request = {
        'Content-type': 'application/x-www-form-urlencoded',
      };
      if (bearerToken != null) {
        request = {
          'Content-type': 'application/x-www-form-urlencoded',
          HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
        };
      }
      response = await get(endPoint, headers: request);
      int statusCode = response
          .statusCode; // this API passes back the id of the new item added to the body
      if (statusCode == 200) {
        body = response.body;
      }
    } // request
    catch (e) {}
// check the status code for the result
    return body;
  }

  static Future<String> makeGetRequestJsonHeaders(
      var endPoint, var bearerToken) async {
    // set up Get request arguments
    Response response;
    String body = "";
    try {
      Map<String, String> request = {
        'Content-type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $bearerToken'
      };
      response = await get(endPoint, headers: request);
      int statusCode = response
          .statusCode; // this API passes back the id of the new item added to the body
      if (statusCode == 200) {
        body = response.body;
      }
    } // request
    catch (e) {}
// check the status code for the result
    return body;
  }
}
