import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/dashboard/providers/transactions_details_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TransactionDetailsScreen extends StatefulWidget {
  final String id;
  final String type;
  final BaseMainRepository baseRepo;
  TransactionDetailsScreen(this.baseRepo, this.id, this.type);
  @override
  _TransactionDetailsScreenState createState() =>
      _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {
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
        create: (context) => TransactionsDetailsProvider(
            widget.baseRepo, widget.id, widget.type),
        child: Scaffold(
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
            body: Consumer<TransactionsDetailsProvider>(
                builder: (context, snapshot, _) {
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SingleChildScrollView(
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
                            itemCount:
                                snapshot.userTransactionsDetailsList().length,
                            primary: true,
                            itemBuilder: (BuildContext content, int index) {
                              return detailsList(
                                  title: snapshot
                                          .userTransactionsDetailsList()[index]
                                      ["title"],
                                  value: snapshot
                                          .userTransactionsDetailsList()[index]
                                      ["value"]);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Visibility(
                          visible: !snapshot.transactionNotFound ?? true,
                          child: Padding(
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
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  Consumer<TransactionsDetailsProvider>(
                      builder: (context, snapshot, _) {
                    return Visibility(
                        visible: snapshot.transactionNotFound ?? false,
                        child: Center(
                          child: Text(
                            'Transaction not found.',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ));
                  })
                ],
              );
            })));
  }
}

Widget detailsList({String title, String value}) {
  return Column(
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
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
