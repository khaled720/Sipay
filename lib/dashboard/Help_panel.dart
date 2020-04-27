import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'merchant_panel.dart';

TextEditingController _search_controller = new TextEditingController();

Widget Help_detail() {
  return Help_detail_Panel();
}

class Help_detail_Panel extends StatefulWidget {
  Help_detail_Panel({Key key}) : super(key: key);
  @override
  _Help_detail_Panel createState() => _Help_detail_Panel();
}

class _Help_detail_Panel extends State<Help_detail_Panel> {
  List<String> help_list = [
    "What is SiPay?",
    "Is it paid to use SiPay?",
    "How do I use it?",
    "What can I do with SiPay Wallet?",
    "What is My Desposit Limit?",
    "Can I Make Deposit 24/7?",
    "How do I use it?",
    "What can I do with SiPay Wallet?",
    "What is My Desposit Limit?",
    "Can I Make Deposit 24/7?"
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
          title: Text("HELP"),
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
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "F.A.Q",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Describe Your issue"),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    color: Colors.white,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            style: TextStyle(color: Colors.black),
                            controller: _search_controller,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                FontAwesomeIcons.search,
                                color: Colors.black26,
                                size: 16,
                              ),
                              hintText: "can I put money in my wallet?",
                              hintStyle:
                                  TextStyle(color: Colors.black26, height: 1.3),
                            ),
                            obscureText: false,
                          ),
                          Container(
                            child: new ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: help_list.length,
                              primary: true,
                              itemBuilder: (BuildContext content, int index) {
                                return detail_list(help_list[index]);
                              },
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
            Dashboardbottom(context, null, null, null),
          ],
        ));
  }

  Widget detail_list(String help_list) {
    return new Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    help_list,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.add,
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          width: double.infinity,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
