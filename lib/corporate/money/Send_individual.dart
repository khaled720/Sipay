import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Money/individual_attention.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextEditingController _amont_ontroller = TextEditingController();
TextEditingController _register_ontroller = TextEditingController();
TextEditingController _IBAN_ontroller = TextEditingController();
TextEditingController _PNR_ontroller = TextEditingController();

Widget Send_individual() {
  return Individual_panel();
}

class Individual_panel extends StatefulWidget {
  Individual_panel({Key key}) : super(key: key);
  @override
  _Individual_panel createState() => _Individual_panel();
}

class _Individual_panel extends State<Individual_panel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _phone;

//  final _formKey = GlobalKey<FormState>();

  bool check_state = true;
  bool check_states = true;
  var _bank_value = "MERCHANT";
  List<String> _listBankData = ["MERCHANT", "INDIVIDUAL"];
  var _try_value = "TRY";
  List<String> _listtryData = ["TRY", "TRYS"];
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
        title: Text("Money Transfer"),
        flexibleSpace: Image(
          image: AssetImage('assets/appbar_bg.png'),
          height: 100,
          fit: BoxFit.fitWidth,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 16,
              ),
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
              size: 16,
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
                'AVAILABLE BALANCE',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                          '292,20₺',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
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
                          "80,00\$",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      )),
                ),
                Expanded(
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '774,80€',
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(80),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'SEND MONEY',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                  Text(
                    'WALLET TYPE',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                    ),
                    items: _listBankData
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.creditCard,
                              color: Colors.grey,
                              size: 15,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                value,
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _bank_value = value;
                      });
                    },
                    value: _bank_value,
                    isExpanded: true,
                  ),
                  Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Text(
                          'RECEIVER PHONE NUMBER',
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.phone,
                          controller: _register_ontroller,
                          onChanged: (text) {
                            if (text.length > 0 && !check_states) {
                              setState(() {
                                check_states = true;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: check_states
                                ? const Icon(
                                    FontAwesomeIcons.phoneAlt,
                                    size: 16,
                                    color: Colors.black45,
                                  )
                                : CupertinoActivityIndicator(),
                          ),
                          obscureText: false,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            child: check_states
                                ? Container(
                                    child: Text(
                                      '',
                                      style: TextStyle(
                                        color: Colors.black38,
                                      ),
                                    ),
                                    height: 0,
                                  )
                                : RichText(
                                    textAlign: TextAlign.right,
                                    text: TextSpan(
                                        // set the default style for the children TextSpans
                                        style: TextStyle(
                                            fontSize: 13, wordSpacing: 3),
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              FontAwesomeIcons.userCheck,
                                              size: 14,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          TextSpan(
                                              text: ' AIGERIM KAIROLDAYEVA',
                                              style: TextStyle(
                                                  color: Colors.blue)),
                                        ])),
                          ),
                        ),
                        Text(
                          'AMOUNT',
                          style: TextStyle(
                              color: check_state ? Colors.black54 : Colors.red,
                              fontSize: 12),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                      color: check_state
                                          ? Colors.black
                                          : Colors.red),
                                  keyboardType: TextInputType.number,
                                  controller: _amont_ontroller,
                                  onChanged: (text) {
                                    if (text.length > 0 && !check_state) {
                                      setState(() {
                                        check_state = true;
                                      });
                                    }
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    prefixIcon: check_state
                                        ? const Icon(
                                            Icons.map,
                                            size: 16,
                                            color: Colors.black45,
                                          )
                                        : const Icon(
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
                                      color: Colors.black54,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 16,
                                    ),
                                    items: _listtryData
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            SizedBox(width: 10),
                                            Expanded(
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Colors.black45),
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
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 120),
                          child: check_state
                              ? Container(
                                  height: 0,
                                )
                              : Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Please enter valid amount",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(20),
                        ),
                        Text(
                          'DESCRIPTION',
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                          controller: _IBAN_ontroller,
                          decoration: InputDecoration(
                            hintText: "Enter Description",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45, width: 1.0)),
                            prefixIcon: const Icon(
                              FontAwesomeIcons.rocketchat,
                              color: Colors.black45,
                              size: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter DESCRIPTION';
                            }
                            return null;
                          },
                          obscureText: false,
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(50),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              if (_amont_ontroller.text.length == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          IndividualAttentionScreen(null, null),
                                    ));
                              } else {
                                setState(() {
                                  check_states = false;
                                  check_state = false;
                                });
                              }
                            },
                            color: Colors.blue,
                            disabledColor: Colors.blue,
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "SEND",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          width: ScreenUtil.getInstance().setWidth(690),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
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
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
