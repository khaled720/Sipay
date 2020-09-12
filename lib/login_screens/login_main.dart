import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttersipay/login_screens/ErrorDialog.dart';
import 'package:fluttersipay/login_screens/SMS_Verification.dart';
import 'package:fluttersipay/login_screens/login_repo.dart';
import 'package:fluttersipay/login_screens/login_widgets.dart';
import 'package:fluttersipay/login_screens/password_verify.dart';
import 'package:fluttersipay/login_screens/providers/login_provider.dart';
import 'package:fluttersipay/login_screens/reset_password.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart' as ola;
import 'package:provider/provider.dart';
import 'dart:ui' as ui;
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:country_provider/country_provider.dart' as pc;
import 'package:shared_preferences/shared_preferences.dart';
import 'login_registration.dart';
import 'login_slide.dart';
import 'package:flutter/services.dart';
import '../login_screens/providers/verify_password_provider.dart';
class MyLoginPage extends StatefulWidget {
MyLoginPage([this.remem,this.email,this.pass,this.phone,this.type,this.passCor]);

var remem,email,pass,phone,type,passCor;

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String countrycode;


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
countrycode=country.dialCode;
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


  if(widget.remem==null) widget.remem=false;

  }


  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
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
    return ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(
            LoginRepository(),
            TextEditingController(text:widget.remem?widget.email:""),
    TextEditingController(
      //PASSWORD
/*       text:widget.remem==true?widget.passCor:"" */
      
      ),
            TextEditingController(text:widget.remem?widget.phone.toString()
            .replaceFirst("+"+countrycode,""):"")
            ,widget.remem
            ),
        child: Scaffold(body: SingleChildScrollView(
          child: Consumer<LoginProvider>(builder: (context, snapshot, _) {
           // snapshot.initRemem();
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: SingleChildScrollView(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('assets/home_logo.png',
                                width: ScreenUtil.getInstance().setWidth(300),
                                height:
                                    ScreenUtil.getInstance().setHeight(190)),
                          ],
                        )),
                      ),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(190),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(60),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: snapshot.customerOrCorporate
                                              ? Colors.blue
                                              : Colors.black26,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                          width: ScreenUtil.getInstance()
                                              .setWidth(345),
                                          child: OutlineButton(
                                            onPressed: () {
                                              snapshot
                                                  .toggleCustomerCorporate();
                                            },
                                            borderSide: new BorderSide(
                                              style: BorderStyle.none,
                                            ),
                                            child: new Text(
                              translator.translate("individual"),           //     'INDIVIDUAL',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: snapshot
                                                          .customerOrCorporate
                                                      ? Colors.blue
                                                      : Colors.black26,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: snapshot.customerOrCorporate
                                              ? Colors.black26
                                              : Colors.blue,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        width: ScreenUtil.getInstance()
                                            .setWidth(345),
                                        child: OutlineButton(
                                          onPressed: () {
                                            snapshot.toggleCustomerCorporate();
                                          },
                                          borderSide: new BorderSide(
                                            style: BorderStyle.none,
                                          ),
                                          child: new Text(
                                          translator.translate("corp"),
                                            style: TextStyle(
                                                fontSize: 16,
                                                color:
                                                    snapshot.customerOrCorporate
                                                        ? Colors.black26
                                                        : Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(90),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(0),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

             snapshot.customerOrCorporate?               
  Container(
          child: Padding(
            padding: EdgeInsets.only(top:15,left: 0.0, right: 10.0),
            child: !snapshot.showIndividualLoginErrorMessage
                ? Container(
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    height: 0,
                  )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                         translator.translate("phoneValidate"),
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserRegistrationScreen()));
                        },
                        child: Text(
                            translator.translate("register"),
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ):Container(),
                            Container(
                              child: snapshot.customerOrCorporate
                                  ? Container(
                                    
                          width: double.infinity,
                                  
                                  child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               //     crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[

/////////////////////////////////////////////////////////////////////////////////

        
GestureDetector(
      child: Container(
        margin:EdgeInsets.only(top:10),
        width: 80,
        height: 30,
        child: Row(

          children: <Widget>[

      Image.asset(country.flagUri, package: 'ola_like_country_picker',width: 30,height: 27,),
     Expanded(child: Text("  +"+country.dialCode+" ",
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





             Expanded(
              
      
               child: IndividualWidget(snapshot)),
             
             
             
                                       ],
                                  )
                                  
                                  )
                                  : CorporateWidget(snapshot),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20),
                            ),
                            Container(
                              child: Row(
                            //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Checkbox(
                                            value:snapshot.rememberPassword,
                                            onChanged: (bool value) {

             snapshot.setRememberPassword(value);
                                            }),
                                        Text(
                                           translator.translate("remember")
                                          ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResetPasswordScreen()),
                                          );
                                        },
                                        child: Text(
                                     translator.translate("forgetPass"),
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30),
                            ),
                            Container(
                              width: ScreenUtil.getInstance().setWidth(690),
                              child: FlatButton(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                        translator.translate("login")
                                      ,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                color: Colors.blue,
                                onPressed: () async{

if(snapshot.userType!=UserTypes.Corporate){                              
if(!snapshot.telephoneController.text.contains("+")){
isIndividual=true;
snapshot.telephoneController.text="+"+countrycode+snapshot.telephoneController.text;
}}

//print(snapshot.userType.toString()+"-3-------*");
            SharedPreferences prefs = await SharedPreferences.getInstance();


prefs.setBool("remember", snapshot.rememberPassword);

            snapshot.login((loginData) 
            {

if(snapshot.rememberPassword==true){
          prefs.setString("phone", snapshot.telephoneController.text);
           // prefs.setString("Type", "indi");

}
  
print("SUCCUSS .........individual..................");
isIndividual=true;
  
                                   Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VerifyPasswordScreen(
                                                    loginData
                                       //   ,pass: snapshot.rememberPassword?widget.pass:"",
                                                    
                                                    )
                                                    
                                                    
                                                    )
                                                    
                                                    );
                                  }, (loginData) {
print("NOT VERIFIED ........merchant..................");
isIndividual=false;

if(snapshot.rememberPassword==true){
            prefs.setString("email", snapshot.emailController.text);
           // prefs.setString("passCor", snapshot.passwordController.text);
              //   prefs.setString("Type", "cor");
}          
                
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SMSVerificationScreen(
                                                 loginData,
                                                    NavigationToSMSTypes.Login,
                                              userType:snapshot.userType
                                              /*       ,
                                                  passCor:widget.passCor,pass: widget.pass,
                                                  */   
                                                    )));
                                  }, (errorMsg) {
                                    print("ERROR ...........................");

                                    showDialog(
                                        context: context,
                                        child: ErrorDialog(() {
                                          Navigator.of(context).pop();
                                        }));
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(10),
                            ),
                            Container(
                              child: snapshot.customerOrCorporate
                                  ? NoAccountWidget()
                                  : null,
                            ),
                          ],
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(610),
                    ),



             /*        Container(
                      padding: EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Text(
                        '%10 OFF SHOPPING IN JUNE!',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(80),
                    ), */
             /*        Container(
                      child: LoginPage(),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(270),
                    ) */
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
          }),
        )));
  }
}
