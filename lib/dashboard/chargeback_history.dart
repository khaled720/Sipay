
import 'package:flutter/material.dart';
import 'package:fluttersipay/utils/api_endpoints.dart' as global;
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class chargeback extends StatefulWidget {
  chargeback({Key key}) : super(key: key);

  @override
  _chargebackState createState() => _chargebackState();
}

class _chargebackState extends State<chargeback> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              centerTitle: true,
        
              title: Text('CHARGEBACK HISTORY',style: TextStyle(fontSize: 15),),
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
      ),
          body: FutureBuilder(
            future: http.get(
global.APIEndPoints.chargebackEndPoint,
headers: {
'Accept':'application/json',
'Content-Type':'application/json',
'Authorization':userToken
}

            ) ,
            builder: (context, snapshot) {
           
if(!snapshot.hasData)return Center(child:CircularProgressIndicator());
print(snapshot.data.body.toString());
  var map=json.decode(snapshot.data.body.toString());
           var  historyList=map["data"]["chargebacks"]["data"];
              return ListView.builder(
                itemCount: historyList.length,
                itemBuilder: (BuildContext context, int index) {
                return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Padding(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text("Payment Id: #"+
                        historyList[index]["payment_id"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Text(
                    historyList[index]["net"].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                       
                      ),
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
                      child: Text( "Transaction Id: #"+historyList[index]["id"].toString()),
                    ),
                    Text(
                       historyList[index]["settlement_date_merchant"].toString(),
                      textAlign: TextAlign.right,
                    )
                  ],
                )
              ],
            ),
            padding: EdgeInsets.only(right: 30, left: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black45,
            height: 1.0,
          )
        ],
      );
               },
              );
            }
          ),
    );
  }
}