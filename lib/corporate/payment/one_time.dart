import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/payment/onetime_success.dart';
import 'package:fluttersipay/utils/api_endpoints.dart' as global;
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget One_Time() {
  return One_Time_panel();
}

class One_Time_panel extends StatefulWidget {
  One_Time_panel({Key key}) : super(key: key);
  @override
  _One_Time_panel createState() => _One_Time_panel();
}

class _One_Time_panel extends State<One_Time_panel> {
  TextEditingController mount = TextEditingController();
  TextEditingController des = TextEditingController();
 TextEditingController product = TextEditingController();
  bool check_state = true;
  bool _remember = false;
double amount;
int currency;
String description;
bool loading=false;
  var _try_value = "TRY";
  List<String> _listtryData = [
    "TRY",
    "TRYS"
  ];

GlobalKey<ScaffoldState> sca =GlobalKey<ScaffoldState>();

GlobalKey<FormState> _key =GlobalKey<FormState>();
 List currencyList =new List();


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

  "Authorization":userToken
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


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrencies();
    currency=1;
  
  
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
      key: sca,
          body: new FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/json/Withdrawl/8.6Withdraw_request.json'),
          builder: (context, snapshot) {
//          request_json users;
            var parsedJson;
            if (snapshot.hasData) {
              parsedJson = json.decode(snapshot.data.toString());
//            users = request_json.fromJson(parsedJson);
              return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text("ONE TIME LINK"),
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
                  body: Stack(
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(50),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                'CREATE ONE TIME LINK',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
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
                                    'Create payment link that works just one time',
                                    style: TextStyle(color: Colors.black54, fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: ScreenUtil.getInstance().setHeight(50),
                                  ),
                                  Text(
                                    'AMOUNT',
                                    style: TextStyle(color:check_state ? Colors.black26 : Colors.red, fontSize: 12),
                                  ),
Form(
key: _key,

  child:   Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  
  
  
  
  
  
  
                                    Container(
  
                                      child: Row(
  
                                        children: <Widget>[
  
                                          Expanded(
  
                                            child:TextFormField(
  onSaved: (val){

amount=double.parse(val.toString());


  },
  controller: mount,
                                              style: TextStyle(color: check_state ? Colors.black : Colors.red),
  
                                              keyboardType: TextInputType.number,
 
                                              onChanged: (val){
  
                                               
                                                  setState(() {
  
                                                amount=double.parse(val.toString());

                                                  });
  
                                                
  
                                              },
  enabled: !_remember,
                                              decoration: InputDecoration(
  
                                                enabledBorder: UnderlineInputBorder(
  
                                                    borderSide: BorderSide(
  
                                                        color: Colors.black26, width: 0.5)),
  
                                                focusedBorder: UnderlineInputBorder(
  
                                                    borderSide: BorderSide(
  
                                                        color: Colors.black26, width: 0.5)),
  
                                                prefixIcon: check_state? const Icon(
  
                                        FontAwesomeIcons.moneyBillWaveAlt ,//         Icons.monetization_on,
  
                                                  size: 16,
  
                                                  color: Colors.black26,
  
                                                ): const Icon(
  
                                                  Icons.cancel,
  
                                                  size: 16,
  
                                                  color: Colors.red,
  
                                                ),
  
                                              ),
  
                                              obscureText: false,
  
                                            ),
  
                                          ),
  
  
  
                                          SizedBox(
  
                                            width: 20,
  
                                          ),
  
                                          Container(
  
                                            decoration: new BoxDecoration(
  
                                              border: Border(
  
                                                bottom: BorderSide(
  
                                                  color: Colors.black26,
  
                                                  width: 0.5,
  
                                                ),
  
                                              ),
  
                                            ),
  
  
  child: DropDown(this.currencyList),
  
  
  /* 


                                            child: FutureBuilder(
        //  stream: Firestore.instance.collection('Cities').snapshots(),
        future: http.get(global.createApi,headers:{

  "Authorization":global.userToken


        }),
        builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
       Map<String,dynamic> body= json.decode(snapshot.data.body.toString());
       List<Map<String,dynamic>> currencyList = body["data"]["currencies"];
          if (!snapshot.hasData) {
            return Text("Loading...");
          }
          return DropdownButtonFormField<String>(
              //           icon: Icon(Icons.keyboard_arrow_down),
              //         iconEnabledColor: Colors.blue,
              hint: Text(
                "Select the city ...",
                /*     style: TextStyle(
                        color: Colors.black, /* fontWeight: FontWeight.w700 */),
                  */
              ),
              decoration:
                  InputDecoration(filled: true, fillColor: Colors.white54),
              //       disabledHint: Text("Enter City Name..."),
              //     isExpanded: true,
              //   isDense: true,
              value: currency,

              onChanged: (String newvale) {
                setState(() {
               currency = newvale;
                });
                print(newvale + "#############NEW VALUE");
              },
              items: []
                                            
        }
        
        ),              */                           
  
  
                                            width: 100,
  
                                          ),
  
                                        ],
  
                                      ),
  
                                    ),
  
                                    SizedBox(
  
                                      height: 15,
  
                                    ),
  






                                    Row(
  
                                      mainAxisAlignment: MainAxisAlignment.start,
  
                                      children: <Widget>[
  
                                        Checkbox(
  
                                          value: _remember,
  
                                          onChanged: (bool value) {
  if (value){
mount.text="0";
amount=0;
                                            setState(() {
  
                                              _remember = value;
  
                                            });

  }else{




                                            setState(() {
  
                                              _remember = value;
  
                                            });


  }
  
                                          },
  
                                        ),
  
                                        Expanded(
  
                                          child: Text("Set by user"),
  
                                        ),
  
                                      ],
  
                                    ),
  
                                    SizedBox(
  
                                      height: 15,
  
                                    ),
  
Text("PRODUCT NAME",
           style: TextStyle(color:check_state ? Colors.black26 : Colors.red, fontSize: 12),
  
)
,TextFormField(

controller: product,
  decoration: InputDecoration(
contentPadding: EdgeInsets.all(2)


  ),
)
,          SizedBox(
  
                                      height: 15,
  
                                    ),
  
                                    Text(
  
                                      'EXPLANATION',
  
                                      style: TextStyle(color:check_state ? Colors.black26 : Colors.red, fontSize: 12),
  
                                    ),
  
                                    SizedBox(
  
                                      height: 20,
  
                                    ),
  
                                    Row(
  
                                      crossAxisAlignment: CrossAxisAlignment.center,
  
                                      mainAxisAlignment: MainAxisAlignment.center,
  
                                      children: <Widget>[
  
                                        Container(
  
                                          child: Icon(
  
                                            FontAwesomeIcons.sms,
  
                                            color: Colors.black26,
  
                                            size: 20,
  
                                          ),
  
                                        ),
  
                                        SizedBox(
  
                                          width: 30,
  
                                        ),
  
  
  
                                        Container(
  
                                          width: MediaQuery.of(context).size.width/1.5,
  
                                          child: TextFormField(
                                            controller: des,
  onSaved: (val){


description=val;

  },
  ///////////////////////////////////////////////////////////////
           
  maxLines: 4,
  
  autofocus: false,
  
  decoration: InputDecoration(
  
  hintText: "Please enter an explanation",
  
  hintStyle: TextStyle(color:check_state ? Colors.black26 : Colors.red, fontSize: 18),
  
  
  
  
  
  
  
  ),
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
                                          ),
  
                                        )
  
  
  
  
  
  
  
                                      ],
  
                                    ),
  
                                    SizedBox(
  
                                      height: 10,
  
                                    ),
  
                             
  
                           
  
  
  
  
  
  
  
  
  
  ],
  
  
  
  
  
  
  
  ),
)  
                           
                           
                                ],
                              ),
                            ),
            /*                 Padding(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: TextField(
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.number,
                                controller: _SMSController,
                                decoration: InputDecoration(
//                                      hintStyle: CustomTextStyle.formField(context),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black12, width: 1.0)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black12, width: 1.0)),
                                ),
                                obscureText: true,
                              ),
                            ), */
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                           padding: EdgeInsets.only(left: 30.0, right: 30),
                              child: FlatButton(
                                onPressed: () async {
                              
                   
                  if(product.text!= "" &&mount.text!= "" && des.text!="" &&product.text!=""){





_key.currentState.save();


setState(() {
  loading=true;
});




 http.post(
  global.APIEndPoints.createApi ,headers:{

  "Authorization":userToken
},body:{	
  "amount":this.amount.toString(),
	"currency":currency.toString(),
	"payment_link_type":1.toString(),
	"description": this.description.toString(),
  "is_amount_set_by_user":_remember?"1":"0",
  "name_of_product":product.text
  }
,
 
).then(
  (res)
  {

print("create dpl res= "+res.body.toString());


if(res.statusCode==200){

Map dpl =json.decode(res.body.toString());
if(dpl['statuscode']==100){

  dpl=dpl["data"]["dpl"];

      Navigator.pop(context);
         Navigator.push(context, MaterialPageRoute(
   builder: (context)=> Onetime_Success(dpl),
                                  ));
                              
                               

}
else{
setState(() {
  loading=false;
});

                               sca.currentState.showSnackBar(SnackBar(
  duration: Duration(seconds: 3),
            content: Text("Failed to create DPL !")
));


}
//print(res.body.toString()+"__===____+++");
      


}else{

  setState(() {
  loading=false;
});
                                sca.currentState.showSnackBar(SnackBar(
  duration: Duration(seconds: 3),
            content: Text("Failed to create DPL !")
));


/* Scaffold.of(context).showSnackBar(
       SnackBar(content: Text("Failed to create one time link",
       textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0, fontWeight: 
       FontWeight.bold),), duration: Duration(seconds: 2), backgroundColor: Colors.red,)
); */
  setState(() {
  loading=false;
});


}


  }



  
  );




  setState(() {
  loading=false;
});




                  }else{
                                   sca.currentState.showSnackBar(SnackBar(
  duration: Duration(seconds: 3),
            content: Text("Some required fields are missing !")
));

   }
                              
                              
                          
                              
                              
                              
                              
                              
                              
                              
                              
                              
                                },
                                color: Colors.blue,
                                disabledColor: Colors.blue,
                                padding: EdgeInsets.all(15.0),
                                child: Container(
                                  child: SizedBox(
                                    child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[


loading==true?Container(width:10,height: 10, child: CircularProgressIndicator(backgroundColor: Colors.white,)) 
:
Icon(FontAwesomeIcons.link, color: Colors.white, size: 15,),
                                    


                                        Text(
                                          "  CREATE DPL",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              width: ScreenUtil.getInstance().setWidth(750),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
    );
  }
}


