import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/payment/email_sharelink.dart';
import 'package:fluttersipay/corporate/payment/sms_sharelink.dart';

import 'dpl_history.dart';


class Dpl_Passivedetal_Panel extends StatefulWidget {
  dynamic map;
  Dpl_Passivedetal_Panel({this.map});
  @override
  _Dpl_Passivedetal_Panel createState() => _Dpl_Passivedetal_Panel();
}

class _Dpl_Passivedetal_Panel extends State<Dpl_Passivedetal_Panel> {


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
                  '#496 ONE TIME LINK',
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
                height: 30,
              ),
             Container(
                child: Column(
children: <Widget>[
detail_list(title:"Type",value:widget.map['type']==1?"One Time":"Multi Time" ),
detail_list(title:"Status",value:widget.map['status'].toString() ),
detail_list(title:"Created",value:widget.map['created_at'].toString() ),
detail_list(title:"Expiry",value:widget.map['type']==1?widget.map['expire_date']: widget.map["expire_date"].toString().replaceFirst("00:", widget.map["expire_time"].toString()+":") ),
detail_list(title:"Amount",value:widget.map['is_amount_set_by_user']==1? "Set by User":widget.map['amount'].toString(),),
detail_list(title:"Maximum Number of uses",value:widget.map['max_number_of_uses'].toString()),
detail_list(title:"Times used",value:widget.map['number_of_uses'].toString() ),

]
                )
              
              ),
              SizedBox(
                height: 80,
              ),
        /*       Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> Dpl_History(),
                    ));
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
              ), */
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
