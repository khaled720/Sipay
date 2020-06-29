

import 'package:shared_preferences/shared_preferences.dart';


String  userToken;

setUserToken() async {
SharedPreferences.getInstance().then((prefs){


userToken="Bearer "+prefs.getString("token");


});


}


final  createApi="https://app.sipay.com.tr/merchant/api/dpl/create";


final smsApi="https://app.sipay.com.tr/merchant/api/dpl/sendsms";




final emailApi="https://app.sipay.com.tr/merchant/api/dpl/sendemail";

final passiveApi="https://app.sipay.com.tr/merchant/api/dpl/list/passive";
final activeApi="https://app.sipay.com.tr/merchant/api/dpl/list/active";






