import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/payment/email_sharelink.dart';
import 'package:fluttersipay/corporate/payment/sms_sharelink.dart';

Widget Dpl_detail() {
  return Dpl_detail_Panel();
}

class Dpl_detail_Panel extends StatefulWidget {
  Dpl_detail_Panel({Key key}) : super(key: key);
  @override
  _Dpl_detail_Panel createState() => _Dpl_detail_Panel();
}

class _Dpl_detail_Panel extends State<Dpl_detail_Panel> {

  var _data_detail = [
    {
      "title": "Type",
      "value": "Multi Time",
    },{
      "title": "Status",
      "value": "Active",
    },{
      "title": "Created",
      "value": "14.08.2019 - 14:23",
    },{
      "title": "Expiry",
      "value": "16.08.2019 - 23:59",
    },{
      "title": "Amount",
      "value": "Set by user",
    },{
      "title": "Maximum number of use",
      "value": "29",
    },{
      "title": "Times used",
      "value": "3",
    },
  ];

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
                  '#334 TIME LINK',
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
                child: new ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _data_detail.length,
                  primary: true,
                  itemBuilder: (BuildContext content, int index){
                    return detail_list(
                        title: _data_detail[index]["title"],
                        value: _data_detail[index]["value"]
                    );
                  },
                ),
              ),
              SizedBox(
                height: 40,
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
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Email_Sharelink(),
                              ));
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
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Sms_Sharelink(),
                              ));
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
                            onPressed: () {},
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
                              FontAwesomeIcons.link,
                              color: Colors.blue,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            'dpl history',
                            style: TextStyle(
                                fontSize: 10, color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil.getInstance().setHeight(60),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(
//                      builder: (context)=> Dpl_History(),
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
              ),
              SizedBox(
                height: 40,
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
