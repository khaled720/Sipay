import 'package:http/http.dart';

class NetworkHelper {
  static Future<String> makePostRequest(
      String endPoint, dynamic postValues) async {
    // make POST Request
    Response response;
    String body = "";
    try {
      response = await post(endPoint,
          body: postValues,
          headers: {'Content-type': 'application/x-www-form-urlencoded'});
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

  static Future<String> makeGetRequest(String endPoint) async {
    // set up Get request arguments
    Response response;
    String body = "";
    try {
      response = await get(endPoint);
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
