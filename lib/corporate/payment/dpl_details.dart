import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/payment/sms_multishare.dart';
import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/payment/email_sharelink.dart';
import 'package:fluttersipay/corporate/payment/sms_sharelink.dart';

import 'email_multishare.dart';



class Dpl_detail_Panel extends StatefulWidget {
  dynamic map;
  Dpl_detail_Panel({this.map});
  @override
  _Dpl_detail_Panel createState() => _Dpl_detail_Panel();
}
GlobalKey<ScaffoldState> _key=new GlobalKey<ScaffoldState>();
class _Dpl_detail_Panel extends State<Dpl_detail_Panel> {


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
      key: _key,
        appBar: AppBar(
          centerTitle: true,
          title: Text("DPL DETAILS"),
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
                  '#'+widget.map['id'].toString()+' TIME LINK',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(40),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  "You can check this direct payment link's detais below",
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(//height: 200,
                child: Column(
children: <Widget>[
detail_list(title:"Type",value:widget.map['type']==1?"One Time":"Multi Time" ),
detail_list(title:"Status",value:widget.map['status'].toString() ),
detail_list(title:"Created",value:widget.map['created_at'] ),
detail_list(title:"Expiry",value:widget.map['type']==1?widget.map['expire_date']: widget.map["expire_date"].toString().replaceFirst("00:", widget.map["expire_time"].toString()+":") ),
detail_list(title:"Amount",value:widget.map['is_amount_set_by_user']==1? "Set by User":widget.map['amount'].toString(),
                                      ),
detail_list(title:"Maximum Number of uses",value:widget.map['max_number_of_uses'].toString()),
detail_list(title:"Times used",value:widget.map['number_of_uses'].toString() ),

]
                )
              
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.email,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onPressed: () {

                              if(widget.map['type']==1){

                                
  Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Email_Sharelink(dpl:widget.map),
                                          ));
                              }else{


                                  Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Email_Multishare(dpl:widget.map),
                                          ));
                              }






                             // Navigator.pop(context);
                          ///    Navigator.push(context, MaterialPageRoute(
                        //        builder: (context) => Email_Sharelink(),
                              //));
                            },
                          ),
                          Text(
                            'E-MAIL',
                            style: TextStyle(
                                fontSize: 10, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.sms,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onPressed: () {


                                if(widget.map['type']==1){


                                Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Sms_Sharelink(dpl:widget.map,),
                                          ));

                                }else{ Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => Sms_Multishare(dpl:widget.map),
                                          ));}
                               

                        /*       Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Sms_Sharelink(),
                              )); */
                            },
                          ),
                          Text(
                            'SMS',
                            style: TextStyle(
                                fontSize: 10, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.whatsapp,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'WHATSAPP',
                            style: TextStyle(
                                fontSize: 10, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.content_copy,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onPressed: ()async {

 await Clipboard.setData(new ClipboardData(text:APIEndPoints.dplLink+widget.map["token"].toString()));


_key.currentState.showSnackBar(SnackBar(
  duration: Duration(seconds: 2),
          content: Text("DPL Link Copied")
));





                            },
                          ),
                          Text(
                            'COPY',
                            style: TextStyle(
                                fontSize: 10, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onPressed: () {

Navigator.pop(context);

                            },
                          ),
                          Text(
                            'cancel',
                            style: TextStyle(
                                fontSize: 10, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          /*     SizedBox(
                height: ScreenUtil.getInstance().setHeight(60),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: FlatButton(
                  onPressed: (){
                  //  Navigator.pop(context);
                //    Navigator.push(context, MaterialPageRoute(
//                      builder: (context)=> Dpl_History(),
              //      ));
                  },
                  color: Colors.blue,
                  disabledColor: Colors.blue,
                  padding: EdgeInsets.all(15.0),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 45,
                        ),
                        SizedBox(
                          child: Icon(Icons.settings_backup_restore, color: Colors.white, size: 17,),
                          width: 30,
                        ),
                        SizedBox(
                          child: Text(
                            "TRAMSACTOPM HISTORY",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                ),
                width: ScreenUtil.getInstance().setWidth(750),
              ),*/
              SizedBox(
                height: 20,
              ) 
            ],
          ),
        ));
  }

  Widget detail_list({String title, String value}) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black38
                  ),
                ),
              ),
              Text(
                value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black
                ),
                textAlign: TextAlign.right,
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          color: Colors.black26,
          height: 1.0,
        )
      ],
    );
  }
}
