import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/payment/success_sharelink.dart';
import 'package:fluttersipay/utils/api_endpoints.dart' as global;
import 'package:http/http.dart' as http;
import 'package:fluttersipay/corporate/global_data.dart';
TextEditingController _phoneController = TextEditingController();

class Sms_Multishare extends StatefulWidget {

Map dpl;
  Sms_Multishare({this.dpl});
  @override
  _Sms_Multishare createState() => _Sms_Multishare();
}

class _Sms_Multishare extends State<Sms_Multishare> {
  bool _checkphone = true;
  @override
  void initState(){
    super.initState();
    _add();
  }
List<Widget> _children = [];
List<TextEditingController> controllers=[];
int _count = 0;
void _add() {


  controllers.add(new TextEditingController());

  _children = List.from(_children)
    ..add(TextField(
                            onChanged: (text){
                              if(text.length > 0 && !_checkphone){
                                setState(() {
                                  _checkphone = true;
                                });
                              }
                            },
                            style: TextStyle(color: _checkphone ? Colors.black : Colors.red),
                           controller: controllers[_count],
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
//                              hintText: 'Phone Number',
//                              hintStyle: CustomTextStyle.formField(context),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: _checkphone ? Colors.black26 : Colors.red, width: 0.5)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: _checkphone ? Colors.black26 : Colors.red, width: 0.5)),
                              prefixIcon: _checkphone ?  const Icon(
                                Icons.phone,
                                color: Colors.black26,
                              ):  const Icon(
                                Icons.cancel,
                                color: Colors.red,
                              ),
                            
                            ),
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              // Fit the validating format.
//                _phoneNumberFormatter,
                            ],
                            obscureText: false,
                          ),);
  setState(() => ++_count);
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
    return Scaffold(
          body: new FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/json/register/2.1Register.json'),
          builder: (context, snapshot){
            Autogenerated users;
            var parsedJson;
            if (snapshot.hasData){
              parsedJson = json.decode(snapshot.data.toString());
              users = Autogenerated.fromJson(parsedJson);
              return new Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('SHARE LINK'),
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
                          Navigator.pop(
                              context
                          );
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
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: ScreenUtil.getInstance().setWidth(60),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'SHARE DPL LINK VIA SMS',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setWidth(50),
                            ),
                            Container(
                              child: Text(
                                'You can share the payment link DPL #'+widget.dpl["id"].toString()+' via SMS.',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black45,
                                ),
                              ),
                              width: ScreenUtil.getInstance().setWidth(690),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(100),
                            ),
                            Row(
                              children: <Widget>[
                                Text('DPL #'+widget.dpl["id"].toString()+' - One Time Link', style: TextStyle(color: Colors.black45, fontSize: 15)),
                                Expanded(
                                  child: Container(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                     widget.dpl['is_amount_set_by_user']==1? "Set by User":
                                     widget.dpl['amount'].toString(),
                                          style: TextStyle(color: Colors.black87, fontSize: 15),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: Colors.black26,
                              height: 1.0,
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text('Expiry', style: TextStyle(color: Colors.black45, fontSize: 15)),
                                ),
                                Container(
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                  widget.dpl['type']==1?widget.dpl['expire_date']: widget.dpl["expire_date"].toString().replaceFirst("00:", widget.dpl["expire_time"].toString()+":"),
                                  style: TextStyle(color: Colors.black87, fontSize: 15),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: Colors.black26,
                              height: 1.0,
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30),
                            ),
                            Row(
                              children: <Widget>[
                                Text('Maximum number of use', style: TextStyle(color: Colors.black45, fontSize: 15)),
                                Expanded(
                                  child: Container(
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          widget.dpl["max_number_of_uses"].toString(),
                                          style: TextStyle(color: Colors.black87, fontSize: 15),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: Colors.black26,
                              height: 1.0,
                            ),
                            SizedBox(
                              height:  ScreenUtil.getInstance().setHeight(80),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'RECIEVER GSM NUMBER *',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black45,
                                    ),
                                  ),
                           SizedBox(
                              width:70,
                            ),         

                            InkWell(
                              
                              onTap: _add,
                              
                              child: Icon(Icons.add_circle,color: Colors.blue,)),
                               SizedBox(
                              width:10,
                            ),        
                             InkWell(
                              
     
     
                              onTap: (){
_count--;
setState(() {
 if(_count!=0){ 
this._children.removeAt(_count);
this.controllers.removeAt(_count);
 }
});

                              },
                              
                              child: Icon(Icons.delete,color: Colors.red,)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20),
                            ),
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                child: _checkphone ?
                                Container(
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                  height: 0,
                                )
                                    :
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'faild number style',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        Column(
          children: _children
        ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(20),
                            ),
                            Container(padding:EdgeInsets.only(bottom:10),
                              child: FlatButton(
                                onPressed: (){
                        int empty=0;
                             bool limit=false;          
                           controllers.forEach((element) { 

                          if(element.text=="")empty++;
                          if(element.text.length<12)limit=true;
                           });

if(empty>0){

//show snake bar
//fields req
Scaffold.of(context).showSnackBar(SnackBar(
  duration: Duration(seconds: 2),
          content: Text("Some required fields are missing !!")
));
}else if(limit== true){

////snake bar
//13<val
Scaffold.of(context).showSnackBar(SnackBar(
  duration: Duration(seconds: 2),
          content: Text("GSM Number must be at least 12 digits")
));


}else{
////load enable

List<String> numbers=[];


controllers.forEach((element) { numbers.add(element.text); });

for(int i=0;i<numbers.length;i++){


http.post(
  global.APIEndPoints.smsApi ,headers:{
"Accept":"application/json",	

  "Authorization":userToken
},body:{

  "dpl_id":widget.dpl["id"].toString(),
	"payment_link_type":"2",
"phone[] ":"+"+numbers[i].toString()
}

).then((res){
print("#######SMS Multi########"+res.body.toString());
if(res.statusCode==200)
{
Map map=json.decode(res.body.toString());
if(map["statuscode"]==100){

///
Scaffold.of(context).showSnackBar(SnackBar(
  duration: Duration(seconds: 2),
          content: Text("Sending completed for GSM Number "+(i+1).toString())
));

}

else{


Scaffold.of(context).showSnackBar(SnackBar(
  duration: Duration(seconds: 2),
          content: Text("Sending failed Review GSM Number "+(i+1).toString())
));



}



}else{

Scaffold.of(context).showSnackBar(SnackBar(
  duration: Duration(seconds: 2),
          content: Text("Sending failed for GSM Number "+(i+1).toString())
));


}







});




}




}



                                  
                               ///     Navigator.pop(context);
                                  ////  Navigator.push(context, MaterialPageRoute(
                                     //// builder: (context) => Success_Sharelink(),
                                    ////));
                                  
                                  
                                  
                                  
                                  
                                  
                               
                                },
                                color: Colors.blue,
                                disabledColor: Colors.blue,
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  'SEND SMS',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              width: ScreenUtil.getInstance().setWidth(690),
                            ),
                          ],
                        )
                    )


                ),
              );
            } else if (snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();

          }),
    );
  }
}
class Autogenerated {
  String header;
  String create;
  String sign;
  String phone;
  String have;
  String button;
  User user;
  Fail fail;

  Autogenerated(
      {this.header,
        this.create,
        this.sign,
        this.phone,
        this.have,
        this.button,
        this.user,
        this.fail});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    create = json['create'];
    sign = json['sign'];
    phone = json['phone'];
    have = json['Have'];
    button = json['button'];
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    fail = json['fail'] != null ? new Fail.fromJson(json['fail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['create'] = this.create;
    data['sign'] = this.sign;
    data['phone'] = this.phone;
    data['Have'] = this.have;
    data['button'] = this.button;
    if (this.user != null) {
      data['User'] = this.user.toJson();
    }
    if (this.fail != null) {
      data['fail'] = this.fail.toJson();
    }
    return data;
  }
}

class User {
  String user;
  String and;
  String privacy;

  User({this.user, this.and, this.privacy});

  User.fromJson(Map<String, dynamic> json) {
    user = json['User'];
    and = json['and'];
    privacy = json['privacy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User'] = this.user;
    data['and'] = this.and;
    data['privacy'] = this.privacy;
    return data;
  }
}

class Fail {
  String user;
  String login;

  Fail({this.user, this.login});

  Fail.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    login = json['login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['login'] = this.login;
    return data;
  }
}