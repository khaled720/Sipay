import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/corporate/transaction/transaction_success.dart';

Widget Ctransaction_detail() {
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
      "value": "#9879654",
    },{
      "title": "Order ID",
      "value": "#766566",
    },{
      "title": "Payment ID",
      "value": "#12345",
    },{
      "title": "Status",
      "value": "Completed",
    },{
      "title": "Credit Card No",
      "value": "****1234",
    },{
      "title": "Card Holder Bank",
      "value": "YAPI KREDI",
    },{
      "title": "Amount",
      "value": "100,55₺",
    },{
      "title": "Product Price",
      "value": "100,00₺",
    },{
      "title": "Merchant Share",
      "value": "95,00",
    },{
      "title": "Date",
      "value": "13:48 - 14.09.2019",
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
          title: Text("TRANSATION DETAILS"),
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
                height: 15,
              ),
              Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Container(
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
                            SizedBox(width: 10),
                            Icon(
                              FontAwesomeIcons.questionCircle,
                              size: 16,
                              color: Colors.black26,
                            ),
                            SizedBox(width: 20),
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
                //                width: 100,
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
                            builder: (context) => Transaction_Success(),
                          ));
                    },
                    color: Colors.blue,
                    disabledColor: Colors.blue,
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "REFUND",
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
