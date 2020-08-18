import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:fluttersipay/login_screens/providers/kyc_provider.dart';
class withdrawHistorty extends StatefulWidget {
 
 BaseMainRepository _baseMainRepository;
 
  withdrawHistorty(this._baseMainRepository);

  @override
  _withdrawHistortyState createState() => _withdrawHistortyState();
}

class _withdrawHistortyState extends State<withdrawHistorty> {
 

 Future<http.Response> getHistory()async{

http.Response res;
res = await http.get(
  //url
  APIEndPoints.kApiIndividualWithdrawTransactionsListEndPoint
,headers: {


"Accept":"application/json",
"Authorization":"Bearer "+widget._baseMainRepository.bearerToken
,
"Content-Type":"application/json"


}

);
 
  return res; 


 }
 
 @override
 void initState() { 
   super.initState();

 }
 
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
                centerTitle: true,
                title: Text("Withdrawal History"),
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
      body: 

FutureBuilder(
  future: getHistory(),
  
  builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
  if(!snapshot.hasData)return Center(child: CircularProgressIndicator());
  var jsn =json.decode(snapshot.data.body);
  print(jsn.toString());
   var list =jsn["data"]['transactions']['data'];
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
      return ListTile(
       // trailing: Text("##"),
        isThreeLine: true,
leading:Container(
  width: 220,
  child:   Column(
  crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(list[index]["bank_name"]
      
      ,
      
      style: TextStyle(fontWeight: FontWeight.bold
      
      ,fontSize: 15
      
      
      
      ),
      
      ),
  Text("IBAN:"+list[index]["iban"]
      
      ,
      
      style: TextStyle(
        //fontWeight: FontWeight.bold
      color: Colors.grey
      ,fontSize: 10
      
      
      
      ), 
      
      ),


    ],
  ),
)
,
title: Row(
  children: <Widget>[
        Text(list[index]["net"].toString()),
   Text(" "+list[index]["currency_symbol"]),
  ],
),
subtitle: Text(list[index]["created_at"]),


/* Row(

children: <Widget>[



],

//

) */

      );
     },
    );

  },
),
  
 
    );

  

    
          
      
    
}}