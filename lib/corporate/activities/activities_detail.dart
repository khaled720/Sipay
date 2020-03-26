import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/activities/activities_edit.dart';

Widget Activities_Detail() {
  return Activities_Detail_Panel();
}

class Activities_Detail_Panel extends StatefulWidget {
  Activities_Detail_Panel({Key key}) : super(key: key);
  @override
  _Activities_Detail_Panel createState() => _Activities_Detail_Panel();
}

class _Activities_Detail_Panel extends State<Activities_Detail_Panel> {

  var _data_detail = [
    {
      "title": "Transaction ID",
      "value": "#766566",
    },{
      "title": "Status",
      "value": "Pending",
    },{
      "title": "Bank",
      "value": "YAPI KREDI",
    },{
      "title": "Amount",
      "value": "100,55₺",
    },{
      "title": "PNR",
      "value": "123456",
    },{
      "title": "IBAN",
      "value": "TR12 0000 0000 0000 0000 0000 12",
    },{
      "title": "Date",
      "value": "13:48 - 14.09.2019",
    },{
      "title": "Processed Date",
      "value": "-",
    },
  ];

  bool check_state = true;

  var _try_value = "TRY";
  List<String> _listtryData = [
    "TRY",
    "TRYS"
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
          title: Text("DEPOSIT DETAILS"),
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
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Container(
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => Activities_Edit(),
                          ));
                    },
                    color: Colors.blue,
                    disabledColor: Colors.blue,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "EDIT AMOUNT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  width: ScreenUtil.getInstance().setWidth(690),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                      fontSize: 16, color: Colors.black45
                  ),
                ),
              ),
              Text(
                value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 16
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
          color: Colors.black12,
          height: 0.5,
        )
      ],
    );
  }
}
