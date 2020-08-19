

import 'package:shared_preferences/shared_preferences.dart';

var isIndividual=false;
String  userToken;

setUserToken() async {
SharedPreferences.getInstance().then((prefs){


userToken="Bearer "+prefs.getString("token");


});


}








