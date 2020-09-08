import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'dart:convert';
class TransactionDetailsScreen extends StatefulWidget {
  var body;
  TransactionDetailsScreen({this.body});

  @override
  _TransactionDetailsScreenState createState() => _TransactionDetailsScreenState();
}

class _TransactionDetailsScreenState extends State<TransactionDetailsScreen> {

List<String> list=translator.currentLanguage=='en'?[

    "Transaction ID",
    "Order ID",
    "Payment ID",
    "Credit Card NO",
    "Updated st",
    "bank Name",
    "date",
    "BACK"
    ]:[

   "İşlem ID",
        "Ödeme ID",
        "Kredi Kartı Numarası",
        "Güncelleme Tarihi",
        "Banka Adı",
        "Tarih",
        "Geri"
    ];




  String type;
  @override
  Widget build(BuildContext context) {
  
  type=widget.body["data"]["searchdata"]["transaction_type"].toString().trim();
  
    return Scaffold(
       


  appBar: AppBar(
              centerTitle: true,
              title: Text(translator.translate("transHis")),
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
        /*       actions: <Widget>[
                Consumer<TransactionsHistoryProvider>(
                    builder: (context, snapshot, _) {
                  return IconButton(
                    padding: const EdgeInsets.only(right: 20.0),
                    icon: Icon(
                      FontAwesomeIcons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      snapshot.searchUserTransactionList();
                    },
                  );
                })
              ], */
            ),




body: Container(
  height: MediaQuery.of(context).size.height-40,
  child:   Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
  
          Expanded(
  
                    child: ListView(
  
      
  
      
  
      
  
        children: <Widget>[
  
      
  
      
    Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text(list[0],style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
   
  
        trailing: Text("#"+widget.body["data"]["searchdata"]["transactionable_id"],
  
        style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.black,
          
          fontWeight: FontWeight.bold),
  
        ),
  
        ),
  
      ),
  
      
  
      Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text(list[1],style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
  
  
        trailing: Text(widget.body["data"][type]["remote_order_id"]??"Not Found",
  
        style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.black,
          fontWeight: FontWeight.bold),
  
        ),
  
        ),
  
      ),
  
      
  
      Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text(list[2],style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
  
        trailing: Text("#"+widget.body["data"][type]["payment_id"]??"Not Found",
  
        style: TextStyle(
  
          fontSize: 13,
  
          color: Colors.black,fontWeight: FontWeight.bold),
  
        ),
  
        ),
  
      ),
  
      
  
  /*     Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text("Status",style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
       // isThreeLine: true,
  
     /*    subtitle: Text("A7a"),
  
        title:Text("xcxz"), */
  
        trailing: Text("#"+widget.body["data"]["searchdata"]["transactionable_id"],
  
        style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.black,fontWeight: FontWeight.bold),
  
        ),
  
        ),
  
      ), */
  
      
  
      Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text(list[3],style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
       // isThreeLine: true,
  
     /*    subtitle: Text("A7a"),
  
        title:Text("xcxz"), */
  
        trailing: Container(width: 180,alignment: Alignment.centerRight,
          child: Text(widget.body["data"][type]["credit_card_no"]??"Not Found",
  
          style: TextStyle(
  
            fontSize: 15,
  
            color: Colors.black,fontWeight: FontWeight.bold),
  
          ),
        ),
  
        ),
  
      ),
  
      
      
  
      Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text(list[5],style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
  
        trailing: Container(
          
          width: 190,alignment: Alignment.centerRight,
          child: Text(widget.body["data"][type]["bank_name"].toString(),
  
          style: TextStyle(
  
            fontSize: 15,
  
            color: Colors.black,fontWeight: FontWeight.bold),
  
          ),
        ),
  
        ),
  
      ),
      
  
      Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text(translator.translate("amount"),style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
       // isThreeLine: true,
  
     /*    subtitle: Text("A7a"),
  
        title:Text("xcxz"), */
  
        trailing: Text(widget.body["data"][type]["net"].toString()+widget.body["data"][type]["currency_symbol"].toString(),
  
        style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.black,fontWeight: FontWeight.bold),
  
        ),
  
        ),
  
      ),
  
      
  
      Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text(list[6],style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
       // isThreeLine: true,
  
     /*    subtitle: Text("A7a"),
  
        title:Text("xcxz"), */
  
        trailing: Text(widget.body["data"][type]["created_at"]??"Not Found",
  
        style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.black,fontWeight: FontWeight.bold),
  
        ),
  
        ),
  
      ),
  
      
  
    
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
        ],
  
      
  
      ),
  
          ),
  
    
  
         Container(margin: EdgeInsets.symmetric(vertical: 10),
  height: 50,
                              child: FlatButton(
  
                                onPressed: () {
  
                         Navigator.pop(context);
  
                                },
  
                                color: Colors.blue,
  
                                padding: EdgeInsets.all(0),
  
                                child: Text(
  
                                list[7],
  
                                  style: TextStyle(
  
                                    color: Colors.white,
  
                                    fontSize: 16,
  
                                  ),
  
                                ),
  
                              ),
  
                              width: ScreenUtil.getInstance().setWidth(690),
  
                            ),
  
    
  
    ],
  
  ),
),




    );
  }
}
















/*FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.blue,
                            disabledColor: Colors.blue,
                            padding: EdgeInsets.all(0),
                            child: Text(
                              "BACK",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ), */