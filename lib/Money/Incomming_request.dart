import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Money/providers/money_requests_list_provider.dart';
import 'package:fluttersipay/Money/request_details.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/utils/app_utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MoneyRequestsListScreen extends StatefulWidget {
  final IndividualMainRepository mainRepository;

  MoneyRequestsListScreen(this.mainRepository);

  @override
  _MoneyRequestsListScreenState createState() =>
      _MoneyRequestsListScreenState();
}

class _MoneyRequestsListScreenState extends State<MoneyRequestsListScreen> {
  var _incoming_data = [
    {
      "title": "#334 - İpek ALAN",
      "value": "102,00 TL",
      "status": "RECEIVED",
      "dates": "11.09.2019 - 12:00",
    },
    {
      "title": "#334 - İpek ALAN",
      "value": "102,00 TL",
      "status": "RECEIVED",
      "dates": "11.09.2019 - 12:00",
    },
    {
      "title": "#334 - İpek ALAN",
      "value": "102,00 TL",
      "status": "RECEIVED",
      "dates": "11.09.2019 - 12:00",
    },
  ];
  var _outgoing_data = [
    {
      "title": "#334 - İpek ALAN",
      "value": "102,00 TL",
      "status": "RECEIVED",
      "dates": "11.09.2019 - 12:00",
    },
    {
      "title": "#334 - İpek ALAN",
      "value": "102,00 TL",
      "status": "RECEIVED",
      "dates": "11.09.2019 - 12:00",
    },
    {
      "title": "#334 - İpek ALAN",
      "value": "102,00 TL",
      "status": "RECEIVED",
      "dates": "11.09.2019 - 12:00",
    },
    {
      "title": "#334 - İpek ALAN",
      "value": "102,00 TL",
      "status": "RECEIVED",
      "dates": "11.09.2019 - 12:00",
    },
    {
      "title": "#334 - İpek ALAN",
      "value": "102,00 TL",
      "status": "RECEIVED",
      "dates": "11.09.2019 - 12:00",
    },
    {
      "title": "#334 - İpek ALAN",
      "value": "102,00 TL",
      "status": "RECEIVED",
      "dates": "11.09.2019 - 12:00",
    },
  ];

  int _index = 0;

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
    return ChangeNotifierProvider(
        create: (context) => MoneyRequestListProvider(widget.mainRepository),
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("MONEY REQUEST"),
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
            body: Consumer<MoneyRequestListProvider>(
                builder: (context, snapshot, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          //                   <--- left side
                                          color: snapshot.incomingState
                                              ? Colors.blue
                                              : Colors.black26,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                          width: ScreenUtil.getInstance()
                                              .setWidth(345),
                                          child: OutlineButton(
                                            onPressed: () {
                                              snapshot.setIncomingState();
                                            },
                                            borderSide: new BorderSide(
                                              style: BorderStyle.none,
                                            ),
                                            child: new Text(
                                              'INCOMING',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: snapshot.incomingState
                                                      ? Colors.blue
                                                      : Colors.black26,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    decoration: new BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          //                   <--- left side
                                          color: snapshot.incomingState
                                              ? Colors.black26
                                              : Colors.blue,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        width: ScreenUtil.getInstance()
                                            .setWidth(345),
                                        child: OutlineButton(
                                          onPressed: () {
                                            snapshot.setIncomingState();
                                          },
                                          borderSide: new BorderSide(
                                            style: BorderStyle.none,
                                          ),
                                          child: new Text(
                                            'OUTGOING',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: snapshot.incomingState
                                                    ? Colors.black26
                                                    : Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                      width: ScreenUtil.getInstance().setWidth(750),
                      height: ScreenUtil.getInstance().setHeight(80),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.incomingState
                            ? snapshot.moneyTransferRequestsList.length
                            : snapshot.moneyTransferSendList.length,
                        primary: true,
                        itemBuilder: (BuildContext content, int index) {
                          return in_out_list(
                              title: snapshot.incomingState
                                  ? '#' +
                                      snapshot.moneyTransferRequestsList[index]
                                              ["id"]
                                          .toString() +
                                      ' - ' +
                                      snapshot.moneyTransferRequestsList[index]
                                          ["user_name"]
                                  : '#' +
                                      snapshot.moneyTransferSendList[index]["id"]
                                          .toString() +
                                      ' - ' +
                                      snapshot.moneyTransferSendList[index]
                                          ["user_name"],
                              value: snapshot.incomingState
                                  ? snapshot.moneyTransferRequestsList[index]["net"].toString() +
                                      ' ' +
                                      AppUtils.mapCurrencyIDToCurrencySign(
                                          snapshot.moneyTransferRequestsList[index]
                                              ['currency_id'])
                                  : snapshot.moneyTransferSendList[index]['net']
                                          .toString() +
                                      ' ' +
                                      AppUtils.mapCurrencyIDToCurrencySign(
                                          snapshot.moneyTransferSendList[index]['currency_id']),
                              status: snapshot.incomingState ? 'RECEIVED' : 'SENT',
                              dates: snapshot.incomingState ? snapshot.moneyTransferRequestsList[index]['created_at'] : snapshot.moneyTransferSendList[index]['created_at'],
                              snapshot: snapshot,
                              index: index,
                              incomingState: snapshot.incomingState);
                        },
                      ),
                    ),
                  ],
                ),
              );
            })));
  }

  Widget in_out_list(
      {String title,
      String value,
      String status,
      String dates,
      int index,
      MoneyRequestListProvider snapshot,
      bool incomingState}) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoneyTransferRequestDetailsScreen(
                snapshot.userRepo,
                snapshot.incomingState
                    ? snapshot.moneyTransferRequestsList[index]["id"].toString()
                    : snapshot.moneyTransferSendList[index]["id"].toString(),
                incomingState ? 'receive' : 'send',
              ),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Text(
                              value,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(status),
                            ),
                            Text(
                              dates,
                              textAlign: TextAlign.right,
                            )
                          ],
                        )
                      ],
                    ),
                    padding: EdgeInsets.only(right: 10),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: incomingState ?? false
                            ? Icon(Icons.check_circle)
                            : null,
                        width: 40,
                      ),
                      Container(
                        child: Icon(
                          FontAwesomeIcons.trash,
                          color: Colors.red,
                        ),
                        width: 40,
                      ),
                    ],
                  ),
                  width: 80,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black45,
            height: 1.0,
          )
        ],
      ),
    );
  }
}
