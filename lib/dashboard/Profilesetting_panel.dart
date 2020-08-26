import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/dashboard/providers/profile_settings_provider.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
 
 
 
 
 
 
 
 
   ola.CountryPicker countryPicker;
 ola.Country country ;// se

 var local = ui.window.locale.countryCode ;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
if(local==null)local='tr';

for(var element in ola.countryCodes){
if(local.toLowerCase()==element["ISO"]){
  setState(() {
    
country = ola.Country.fromJson(element); 
//countrycode=country.dialCode;
  });
}
}
   countryPicker = ola.CountryPicker(
     onCountrySelected: (country) {
      print(country);
      setState(() {
        this.country =country as ola.Country ;

   //  countrycode=country.dialCode;
      });

   });


//  if(widget.remem==null) widget.remem=false;

  }



 
 
 
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
            TextEditingController(),
            TextEditingController()),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('PROFILE SETTINGS'),
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
                    // do something
                  },
                )
              ],
            ),
            body: Consumer<ProfileSettingsProvider>(
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
                                "UPDATE LOGO",
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
                            "COUNTRY:",
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
child: GestureDetector(
      child: Container(
        margin:EdgeInsets.only(top:20),
        width: 200,
        height: 30,
        child: Row(

          children: <Widget>[

      Image.asset(country.flagUri, package: 'ola_like_country_picker',width: 30,height: 27,),
     Expanded(child: Text(""+country.name+" ",
     style: TextStyle(fontWeight: FontWeight.bold),
     overflow: TextOverflow.ellipsis,))

          ],
        ),
        
      ),
      onTap: () {
        countryPicker.launch(context);
  
      })
,

                              )
                              : SizedBox(
                                  width: 0.0,
                                ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "CITY",
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
                            "ADDRESS",
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
                                countri:country.name
                                );
                              },
                              color: Colors.blue,
                              disabledColor: Colors.blue,
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                "SAVE",
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
            })));
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
