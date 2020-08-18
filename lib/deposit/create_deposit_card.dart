import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:fluttersipay/utils/api_endpoints.dart' as global;
import 'package:http/http.dart' as http;
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'deposit_success.dart';

TextEditingController _name_ontroller = TextEditingController();
TextEditingController _card_controller = TextEditingController();
TextEditingController _EXPIRY_ontroller = TextEditingController();
TextEditingController _CVV_ontroller = TextEditingController();
TextEditingController _AMOUNT_ontroller = TextEditingController();

Widget Create_Card(accList) {

  return Card_panel(accList: accList,);
}

class Card_panel extends StatefulWidget {
  var accList;
  Card_panel({this.accList});
  @override
  _Card_panel createState() => _Card_panel();
}

class _Card_panel extends State<Card_panel> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getCurrencies();
  }


  final _formKey = GlobalKey<FormState>();


String cnt="TRY";
  List currencyList =new List();
int currency =1;

      Widget DropDown(List data)
      {
        if(data!=null)
        {
          return DropdownButtonFormField(
            onSaved: (val){
if(val!=null){


currency=int.parse(val.toString());


}else{

currency=1;


}

            },/* 
            validator: (val){


if(val==null)

            }, */
            items: data.map((item) {
              return new DropdownMenuItem(
                child: new Text(
                  item['code'],
                  style: TextStyle(fontSize: 14.0),
                ),
                value: item['id'].toString(),
              );
            }).toList(),
            hint: Text(
              "TRY",
              style: TextStyle(
                color: Colors.black45,
              ),),
            onChanged: (newVal) {
              setState(() {
              currency = int.parse(newVal);
            //    customerid = newVal;
              print('customrid:' + newVal.toString());
              });
            },
        //    value: _mySelection,
          );
      }
      else{
        return new Center(
         child: CircularProgressIndicator(),
        );
        }
      }

    


getCurrencies(){

var response= http.get(global.APIEndPoints.createApi,headers:{

  "Authorization":   "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImQ5ZTAwNjYwMWZjZTFhMGQzMmU1NzI5Y2ZkODVkMGEyNmVjZDE5NDNkZWVmOGJkNmI0MTFlMmU2MGIyYmFhNzlhOThjMTdmZWRkNWQ5OTExIn0.eyJhdWQiOiIxNSIsImp0aSI6ImQ5ZTAwNjYwMWZjZTFhMGQzMmU1NzI5Y2ZkODVkMGEyNmVjZDE5NDNkZWVmOGJkNmI0MTFlMmU2MGIyYmFhNzlhOThjMTdmZWRkNWQ5OTExIiwiaWF0IjoxNTk0NDE4NTU2LCJuYmYiOjE1OTQ0MTg1NTYsImV4cCI6MTYyNTk1NDU1Niwic3ViIjoiMzEiLCJzY29wZXMiOltdfQ.qQIcbsPDF9erdTZTIGIx7MY_6ET2e23woF5n1YaKB_Fedc7WgO5nFLcBQ45ZnJ5GUj4R7zKkiNLbXPFHqbFVgSaYrcRhcfUx4dac-01uFhFfO2P6iI_lU6wvf8JvC_2dMgKCApiEVpcEAcBM_JwCqUfQdVnjuvfGRNpi-RKDMsVdBU9iR5_gkiccbnw6qIM-kgN2ZaJwa7mHTXef2RzWpYLpaPnw2kAhXq5q2VrFMUU2qTFc0D7Ux2fxnGQoyWeEXb6rWWn16EPnzBMb_VFxNgQWgIKSSRK18QX44En2X7F8Bl_xEQmA0CeAq_z6KUNpvf3tPlbnUiKjFVB29KO_4NX_Y8BYxS-C0ZFjg51teXFGjg43__a2-MukV5oPzFM5nP26vOpLDR6NNiD9n__uAFgSdLCWEbrkddmqjlpZ3WrFbRMxjq_sT1TUv9evtgXli7a29fL584fByuUPsUHXpMv-90CXav4wABezvLo1Zc-Pttx5d-mT8Dq4iERj21Jc4k5viO3GR-Y4_4g6R_KP8KYF7vGauNCtpZAzsizoyoui8Ze0AL7Vr"      //userToken
,
"Accept":"application/json"
,
"Content-Type":"application/json"
      });

response.then((value){

 Map<String,dynamic> body= json.decode(value.body.toString());
  setState(() {
      currencyList = body["data"]["currencies"];
   
  });
    



});


}



  var _try_value;
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
    return new FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/json/deposit/6.3Deposit_card.json'),
        builder: (context, snapshot) {
          DepositCardUIModel users;
          var parsedJson;
          if (snapshot.hasData) {
            parsedJson = json.decode(snapshot.data.toString());
            users = DepositCardUIModel.fromJson(parsedJson);
            if (_try_value == null) _try_value = users.trys[0];
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(users.header),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(50),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        users.abailable,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(50),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              decoration: new BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.black54,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  users.abailableBalances[0] + '₺',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              decoration: new BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.black54,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  users.abailableBalances[1] + "\$",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                              )),
                        ),
                        Expanded(
                          child: Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                users.abailableBalances[2] + '€',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(50),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            users.card,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(10),
                          ),
                          Text(
                            users.credit,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Container(
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset('assets/card.png'),
                            ),
                            height: ScreenUtil.getInstance().setHeight(200),
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(20),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Text(
                                  users.depositFields[0],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _name_ontroller,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    prefixIcon: const Icon(
                                   FontAwesomeIcons.wallet,
                                      size: 16,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter NAME';
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Text(
                                  users.depositFields[1],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.number,
                                  controller: _card_controller,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.hashtag,
                                      size: 16,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter NUMBER';
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(20),
                                ),
                                Text(
                                  users.abailableBalances[2],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          controller: _EXPIRY_ontroller,
                                          decoration: InputDecoration(
                                            hintText: "EXPIRY",
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            prefixIcon: const Icon(
                                              FontAwesomeIcons.hashtag,
                                              color: Colors.black45,
                                              size: 16,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter EXPIRY';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          style: TextStyle(color: Colors.black),
                                          keyboardType: TextInputType.number,
                                          controller: _CVV_ontroller,
                                          decoration: InputDecoration(
                                            hintText: "CVV",
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            prefixIcon: const Icon(
                                              FontAwesomeIcons.hashtag,
                                              color: Colors.black45,
                                              size: 16,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter CVV';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                                Text(
                                  users.depositFields[3],
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Expanded(
                                        child: TextFormField( inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
    ],keyboardType: TextInputType.number,
                                          style: TextStyle(color: Colors.black),
                                          controller: _AMOUNT_ontroller,
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            prefixIcon: const Icon(
                                            FontAwesomeIcons.moneyBillWaveAlt,
                                              size: 16,
                                              color: Colors.black45,
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Please enter AMOUNT';
                                            }
                                            return null;
                                          },
                                          obscureText: false,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        decoration: new BoxDecoration(
                                       
                                        ),
                                       child:DropdownButton<String>(
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                                size: 16,
                                              ),
                                              items:["TRY","USD","EUR"]
                                                  .map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                        child: Text(
                                                          value,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black45),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                      setState(() {
                                           cnt=value;
                                        
                                      });
                                              },
                                              value: cnt,
                                              isExpanded: true,
                                            ),
                                        width: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {
                                
                     if(this._formKey.currentState.validate()){






                           int i=0;
                              for(var k in widget.accList)if(k==cnt)i=1;

                              if(i!=1){
      Flushbar(
    icon: Icon(Icons.warning,color: Colors.red,size: 25,),
                  margin: EdgeInsets.all(8),
                  borderRadius: 15,
                  message:  "You are allowed to deposit by Credit Card using "+widget.accList.toString()+" only",
                  duration:  Duration(seconds: 5),              
                )..show(context);


                              }else{

Flushbar(
    icon: Icon(Icons.check_circle,color: Colors.amber,size: 25,),
                  margin: EdgeInsets.all(8),
                  borderRadius: 15,
                  message:  "Success",
                  duration:  Duration(seconds: 5),              
                )..show(context);



                              }
                           
                                 
                                
                                /*       Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DepositSuccessScreen(null),
                                          ));  
*/


                     }

                                    },
                                    color: Colors.blue,
                                    disabledColor: Colors.blue,
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      users.button,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  width: ScreenUtil.getInstance().setWidth(690),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(30),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        });
  }
}

class DepositCardUIModel {
  String header;
  String abailable;
  List<String> abailableBalances;
  String card;
  String credit;
  List<String> depositFields;
  List<String> trys;
  String button;

  DepositCardUIModel(
      {this.header,
      this.abailable,
      this.abailableBalances,
      this.card,
      this.credit,
      this.depositFields,
      this.trys,
      this.button});

  DepositCardUIModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    card = json['card'];
    credit = json['credit'];
    depositFields = json['deposit_fields'].cast<String>();
    trys = json['trys'].cast<String>();
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['card'] = this.card;
    data['credit'] = this.credit;
    data['deposit_fields'] = this.depositFields;
    data['trys'] = this.trys;
    data['button'] = this.button;
    return data;
  }
}
