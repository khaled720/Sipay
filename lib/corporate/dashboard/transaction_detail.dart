import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget C_Transaction_detail() {
  return Transaction_detail_Panel();
}

class Transaction_detail_Panel extends StatefulWidget {
  Transaction_detail_Panel({Key key}) : super(key: key);
  @override
  _Transaction_detail_Panel createState() => _Transaction_detail_Panel();
}

class _Transaction_detail_Panel extends State<Transaction_detail_Panel> {

  var _data_detail = [
    {
      "title": "Transaction ID",
      "value": "#344",
    },{
      "title": "REQUEST SENDER",
      "value": "#344",
    },{
      "title": "Transaction ID",
      "value": "#344",
    },{
      "title": "Transaction ID",
      "value": "#344",
    },{
      "title": "Transaction ID",
      "value": "#344",
    },{
      "title": "Transaction ID",
      "value": "#344",
    },{
      "title": "Transaction ID",
      "value": "#344",
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
          title: Text("TRANSATION DETAILS cor"),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Container(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.blue,
                    disabledColor: Colors.blue,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "BACK",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  width: ScreenUtil.getInstance().setWidth(690),
                ),
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
                      fontSize: 20
                  ),
                ),
              ),
              Text(
                value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
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
          color: Colors.black45,
          height: 1.0,
        )
      ],
    );
  }
}
