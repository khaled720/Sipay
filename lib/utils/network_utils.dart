import 'dart:io';

import 'package:http/http.dart';

class NetworkHelper {
  static Future<String> makePostRequest(
      String endPoint, dynamic postValues, var bearerToken) async {
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

  static Future<String> makeGetRequest(String endPoint, var bearerToken) async {
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
}
