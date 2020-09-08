import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:http/http.dart' as http;
import 'package:fluttersipay/utils/api_endpoints.dart' as global;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:country_provider/country_provider.dart' as cp;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/dashboard/providers/profile_settings_provider.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:ola_like_country_picker/ola_like_country_picker.dart' as ola;
import 'dart:convert';
class ProfileSettingsScreen extends StatefulWidget {
  final BaseMainRepository repo;
  final MainApiModel userLoginInfo;

  ProfileSettingsScreen(this.repo, this.userLoginInfo);

  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
 var _city="";
 var _country="Afghanistan";
 var _address="";

 
 int i=0;

 var local = ui.window.locale.countryCode ;

 
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1304, allowFontScaling: true)
          ..init(context);
    return ChangeNotifierProvider(
        create: (context) => ProfileSettingsProvider(
            widget.repo,
            widget.userLoginInfo,
            CountryPickerUtils.getCountryByIsoCode('TR'),
            TextEditingController(text:this._city),
            TextEditingController(text:this._address)),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(translator.translate("profSettings")),
              flexibleSpace: Image(
                image: AssetImage('assets/appbar_bg.png'),
                height: 100,
                fit: BoxFit.fitWidth,
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              actions: <Widget>[
                IconButton(
                  padding: const EdgeInsets.only(right: 20.0),
                  icon: Icon(
                    FontAwesomeIcons.commentAlt,
                    color: Colors.white,
                  ),
                  onPressed: () {
                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Live_Support(),
                                          ));
                    // do something
                  },
                )
              ],
            ),
            body:
            
             FutureBuilder<Object>(


              future: http.get(
global.APIEndPoints.kApiIndividualUserProfileEndPoint
,headers: {
"Accept":"application/json",
"Authorization":userToken
}),
              builder: (context,dynamic snapsho) {
if(!snapsho.hasData) return Center(child: CircularProgressIndicator());

Map map = json.decode(snapsho.data.body.toString());

//this._country
var countryID =map["data"]["user"]["country"].toString();

  for(var element in map["data"]["countries"].entries){
  if(countryID==element.key)_country=element.value;
  
}  
print(">>>> "+map["data"]["user"].toString());
//print(">>>> "+map["data"]["countries"].toString());
this._city=map["data"]["user"]["city"].toString();
this._address=map["data"]["user"]["address"].toString();

                return Consumer<ProfileSettingsProvider>(
                    builder: (context, snapshot, _) {
                  return Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Padding(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(60),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                        backgroundImage:
                                            snapshot.userProfileImage != null
                                                ? NetworkImage(
                                                    snapshot.userProfileImage
                                                        .toString()
                                                        .trim(),
                                                  )
                                                : (snapshot.imageFromGallery != null
                                                    ? FileImage(
                                                        snapshot.imageFromGallery,
                                                      )
                                                    : Image.asset(
                                                        'assets/user_avatar.png',
                                                        fit: BoxFit.cover,
                                                      ).image)),
                                    height: ScreenUtil.getInstance().setHeight(130),
                                    width: ScreenUtil.getInstance().setHeight(130),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              snapshot.userName,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            width: ScreenUtil.getInstance()
                                                .setWidth(500),
                                          ),
                                          SizedBox(
                                            height: ScreenUtil.getInstance()
                                                .setHeight(20),
                                          ),
                                          Container(
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                snapshot.phoneNumber,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black45,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: FlatButton(
                                  onPressed: () {
                                    snapshot.pickImageFromLibrary(() {
                                      Flushbar(
                                          title: "Successful",
                                          message: 'Image Uploaded!',
                                          duration: Duration(seconds: 3))
                                        ..show(context);
                                    });
                                  },
                                  color: Colors.blue,
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                   translator.translate("updatelogo"),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                width: ScreenUtil.getInstance().setWidth(690),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                               translator.translate("country"),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black45,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              snapshot.countriesList != null
                                  ? Container(
child: DropdownButton(
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
                                            items: 
                            map["data"]["countries"].values.map<DropdownMenuItem<String>>((value) =>
                     new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    )
                  ).toList()
                                      ,      
                                          
                                            onChanged: (value) {
                          setState(() {
                          _country=value;
                              
                          });
                                          },
                                            value: _country,
                                            isExpanded: true,
                                          )
,

                                  )
                                  : SizedBox(
                                      width: 0.0,
                                    ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                              translator.translate("city"),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black45,
                                ),
                              ),
                              TextField(
                                style: TextStyle(color: Colors.black),
                                controller: snapshot.cityController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black38, width: 1.0)),
                                    prefixIcon: const Icon(
                                      Icons.location_on,
                                      color: Colors.black38,
                                      size: 16,
                                    )),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                             translator.translate("address"),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black45,
                                ),
                              ),
                              TextField(
                                controller: snapshot.addressController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black38, width: 1.0)),
                                    prefixIcon: const Icon(
                                      Icons.location_on,
                                      color: Colors.black38,
                                      size: 16,
                                    )),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                child: FlatButton(
                                  onPressed: () {
                                    snapshot.saveProfileUpdate(() {
                                      Navigator.of(context).pop();
                                      Flushbar(
                                          title: "Successful",
                                          message:
                                              'Your profile was successfully uploaded',
                                          duration: Duration(seconds: 3))
                                        ..show(context);
                                    }, () {
                                      Flushbar(
                                          title: "Failure",
                                          message:
                                              'Failed to update your profile. Please try again.',
                                          duration: Duration(seconds: 3))
                                        ..show(context);
                                    },
                                    countri:_country
                                    );
                                  },
                                  color: Colors.blue,
                                  disabledColor: Colors.blue,
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                 translator.translate("save"),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                width: ScreenUtil.getInstance().setWidth(690),
                              ),
                              SizedBox(
                                height: 60,
                              )
                            ],
                          ),
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        ),
                      ),
                      //  Dashboardbottom(context, null, null, null),
                      LoadingWidget(
                        isVisible: snapshot.showLoad ?? false,
                      )
                    ],
                  );
                });
              }
            )));
  }

  Widget _buildDropdownItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            width: 8.0,
          ),
          Text(country.isoCode),
        ],
      );
}
