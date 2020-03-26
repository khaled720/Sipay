import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/activities/activities.dart';

Widget Activities_Edit() {
  return Activities_Edit_Panel();
}

class Activities_Edit_Panel extends StatefulWidget {
  Activities_Edit_Panel({Key key}) : super(key: key);
  @override
  _Activities_Edit_Panel createState() => _Activities_Edit_Panel();
}

class _Activities_Edit_Panel extends State<Activities_Edit_Panel> {

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
          title: Text("EDIT DEPOSIT"),
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
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'REFUND AMOUNT',
                      style: TextStyle(color:check_state ? Colors.black26 : Colors.red, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child:TextFormField(
                        style: TextStyle(color: check_state ? Colors.black : Colors.red),
                        keyboardType: TextInputType.number,
                        onChanged: (text){
                          if(text.length > 0 && !check_state){
                            setState(() {
                              check_state = true;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black26, width: 0.5)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black26, width: 0.5)),
                          prefixIcon: check_state? const Icon(
                            Icons.map,
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
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,size: 16, color: Colors.black26,
                          ),
                          items:_listtryData.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child:  Text(
                                      value,
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _try_value = value;
                            });
                          },
                          value: _try_value,
                          isExpanded: true,
                        ),
                      ),
                      width: 100,
                    ),
                  ],
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
                            builder: (context) => C_Activities(),
                          ));
                    },
                    color: Colors.blue,
                    disabledColor: Colors.blue,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "SAVE",
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
