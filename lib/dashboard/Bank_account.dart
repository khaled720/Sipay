import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'add_new_account.dart';
import 'edit_bank_accounts.dart';
import 'merchant_panel.dart';

var _accounts_data = [
  {
    "title": "My TEB",
    "trys": "TR98 9877 5665 9876 6541 22",
    "active": "TÜRK EKONOMİ BANKASI A.Ş.",
  },
  {
    "title": "YAPIKREDİ Savings",
    "trys": "TR98 9877 5665 9876 6541 22",
    "active": "YAPI VE KREDİ BANKASI A.Ş.",
  }
];

Widget Bank_account() {
  return Bank_account_Panel();
}

class Bank_account_Panel extends StatefulWidget {
  Bank_account_Panel({Key key}) : super(key: key);
  @override
  _Bank_account_Panel createState() => _Bank_account_Panel();
}

class _Bank_account_Panel extends State<Bank_account_Panel> {
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
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('BANK ACCOUNTS'),
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
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'ADD NEW',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ADD_new_account(),
                                ));
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: new ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _accounts_data.length,
                      primary: true,
                      itemBuilder: (BuildContext content, int index) {
                        return Accounts_list(
                            title: _accounts_data[index]["title"],
                            trys: _accounts_data[index]["trys"],
                            actives: _accounts_data[index]["active"]);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
            Dashboardbottom(context, null, null),
          ],
        ));
  }

  Widget Accounts_list({String title, String trys, String actives}) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Padding(
            padding: EdgeInsets.only(left: 30.0, right: 20.0),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              trys,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              'TRY',
                              textAlign: TextAlign.left,
                            ),
                          ),
                          flex: 2,
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(10),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Text(
                              actives,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          flex: 3,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              'ACTIVE',
                              textAlign: TextAlign.left,
                            ),
                          ),
                          flex: 2,
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          FontAwesomeIcons.edit,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Edit_bank_account(),
                              ));
                        },
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.trash,
                            color: const Color(0xFFc14b6f)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            )),
        SizedBox(
          height: 20,
        ),
        Divider(
          color: Colors.black26,
          height: 1.0,
        )
      ],
    );
  }
}
