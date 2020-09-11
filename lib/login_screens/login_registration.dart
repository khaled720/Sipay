import 'dart:convert';
import 'package:country_pickers/country.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/login_screens/privacy_Policy.dart';
import 'package:fluttersipay/login_screens/providers/register_provider.dart';
import 'package:fluttersipay/login_screens/user_Agreement.dart';
import 'package:fluttersipay/login_screens/user_kyc_sms_verify.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart' as ola;

import 'package:fluttersipay/utils/custom_text_style.dart';
import 'package:provider/provider.dart';
import 'package:country_pickers/country_pickers.dart';
import 'json_models/individual_ui_registration_model.dart';
import 'dart:ui' as ui;
import 'package:country_provider/country_provider.dart' as pc;

class UserRegistrationScreen extends StatefulWidget {
  @override
  UserRegistrationScreenState createState() => UserRegistrationScreenState();
}

class UserRegistrationScreenState extends State<UserRegistrationScreen> {
 ola.Country country ;// se
  String countrycode;
   ola.CountryPicker countryPicker;
   var local = ui.window.locale.countryCode ;
  String phoneNumber;
  Country s;

@override
  void initState() {
    // TODO: implement initState
    super.initState();


for(var element in ola.countryCodes){
if(local.toLowerCase()==element["ISO"]){
  setState(() {
    
country = ola.Country.fromJson(element); 

  });
}
}
   countryPicker = ola.CountryPicker(
     onCountrySelected: (country) {
      print(country);
      setState(() {
        this.country =country as ola.Country ;
     countrycode=country.dialCode;
      });

   });



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
    return FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/json/register/2.2Registration.json'),
        builder: (context, snapshot) {
         // RegistrationModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
          //  users = RegistrationModel.fromJson(parsedJson);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(translator.translate("registration").toString().toUpperCase()),
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
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // do something
                                  
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Live_Support(),
                                          ));
                                    
                    },
                  )
                ],
              ),
              body: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: ChangeNotifierProvider<RegisterProvider>(
                          create: (context) => RegisterProvider(
                              LoginRepository(), TextEditingController()),
                          child: Consumer<RegisterProvider>(
                              builder: (context, snapshot, _) {
                            return Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height:
                                          ScreenUtil.getInstance().setWidth(60),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                     
                                      translator.translate("registration").toUpperCase(),

                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          ScreenUtil.getInstance().setWidth(60),
                                    ),
                                    Container(
                                      child: Text(
                                        translator.translate("enterphone"),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      width: ScreenUtil.getInstance()
                                          .setWidth(690),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(10),
                                    ),
                                    Container(
                                      child: Row(
                                        /*   text: TextSpan(
                                              // set the default style for the children TextSpans
                                              style: TextStyle(
                                                fontSize: 16,
                                              ), */
                                              children: [
                                            InkWell(


                                              onTap: (){
//user agree

   Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      agree()));


                                              },
                                                  child: Text(
                                                   translator.translate("user")+" "+translator.translate("agreement"),
                                                  style: TextStyle(
                                                      color: Colors.blue)),
                                            ),
                                            Text(
                                                 ' & ',
                                                style: TextStyle(
                                                    color: Colors.black45)),
                                            InkWell(
onTap: (){
   Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      pPolicy()));







},
                                                child: Text(
                                                   translator.translate("PPplicy"),
                                                  style: TextStyle(
                                                      color: Colors.blue)),
                                            ),
                                          ])
                                          )
                                          ,
                                  
                                    
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(200),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(20),
                                    ),
                         /*   CountryCodePicker(
         onChanged: print,
         // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
         initialSelection: 'TR',
       
         // optional. Shows only country name and flag
         showCountryOnly: false,
         // optional. Shows only country name and flag when popup is closed.
         showOnlyCountryWhenClosed: false,
         // optional. aligns the flag and the Text left
         alignLeft: false,
       ), */
           
                       
Row(
  children: <Widget>[
        Container(
          //color: Colors.grey[200],
       // height: 50,
          child: 


GestureDetector(
      child: Container(
        margin:EdgeInsets.only(top:20),
        width: 70,
        height: 30,
        child: Row(

          children: <Widget>[

      Image.asset(country.flagUri, package: 'ola_like_country_picker',width: 30,height: 27,),
     Expanded(child: Text("+"+country.dialCode,
     style: TextStyle(fontWeight: FontWeight.bold),
     overflow: TextOverflow.ellipsis,))

          ],
        ),
        
      ),
      onTap: () {
        countryPicker.launch(context);
           if(snapshot.telephoneController.text.contains("+")){

snapshot.telephoneController.text="";                              
                            }
      },
    ),

  ),
 
     Expanded(
            child: TextField(          inputFormatters: [
        LengthLimitingTextInputFormatter(14),
      ],
                                        style: TextStyle(color: Colors.black),
                                      //  controller: snapshot.telephoneController,
                                        onChanged: (val){

                                    phoneNumber=val;


                                        },
                                        
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                             
                                            hintText: translator.translate("phoneNo"),
                                            hintStyle: CustomTextStyle.formField(
                                                context),
                                            errorText:
                                                snapshot.phoneNumberErrorText,
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black38,
                                                    width: 1.0)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black38,
                                                    width: 1.0)),
                                       /*      prefixIcon: const Icon(
                                              Icons.phone,
                                              color: Colors.black38,
                                            ) */
                                            ),
                                  //      inputFormatters: [maskFormatter],
                                      ),
     ),
 
  ],
),
                                
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(30),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                       translator.translate("alreadyreg"),
                                        style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).popUntil(
                                              (route) => route.isFirst);
                                        },
                                        child: Text(
                                     translator.translate("loginhere"),
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(60),
                                    ),
                                    Container(
                                      child: FlatButton(
                                        onPressed: () {
                                snapshot.telephoneController.text= "+"+countrycode+phoneNumber;
                                print( snapshot.telephoneController.text);
                               print(snapshot.telephoneController.text);
                                          snapshot.registerIndividual(
                                              (loginData) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SMSUserVerificationScreen(
                                                            loginData)));
                                          }, (errorMsg) {
                                            Flushbar(
                                                title: "Error in login",
                                                message: '$errorMsg',
                                                duration: Duration(seconds: 5))
                                              ..show(context);
                                          }); 
                                        },
                                        color: Colors.blue,
                                        disabledColor: Colors.blue,
                                        padding: EdgeInsets.all(15.0),
                                        child: Text(
                                      translator.translate("register").toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      width: ScreenUtil.getInstance()
                                          .setWidth(690),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: snapshot.showLoad,
                                  child: SpinKitChasingDots(
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            );
                          })))),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}
