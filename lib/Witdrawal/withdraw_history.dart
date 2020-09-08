import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:fluttersipay/login_screens/providers/kyc_provider.dart';
class withdrawHistorty extends StatefulWidget {
  withdrawHistorty(this._baseMainRepository);

 BaseMainRepository _baseMainRepository;

  @override
  _withdrawHistortyState createState() => _withdrawHistortyState();
}

class _withdrawHistortyState extends State<withdrawHistorty> {
 @override
 void initState() { 
   super.initState();

 }

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
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
                centerTitle: true,
                title: Text(translator.translate("WithHis")),
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
      return 
Padding(
  padding: const EdgeInsets.symmetric(vertical: 5),
  child:   Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
  
  children: <Widget>[
  
   Column(
  
      crossAxisAlignment: CrossAxisAlignment.start,
  
        children: <Widget>[
  
          Container(
  
            width: 250,
  
            child: Text(list[index]["bank_name"].toString()
  
            ,
  
            style: TextStyle(fontWeight: FontWeight.bold
  
            ,fontSize: 15
  
            ),
  
            ),
  
          ),
  
      Text(translator.translate("iban")+":"+list[index]["iban"].toString()
  
          ,
  
          style: TextStyle(
  
            //fontWeight: FontWeight.bold
  
          color: Colors.grey
  
          ,fontSize: 12
  
          ), 
  
          ),
  
    Text(list[index]["created_at"].toString()
  
    ,
  
     style: TextStyle(
  
            //fontWeight: FontWeight.bold
  
          color: Colors.grey
  
          ,fontSize: 12
  
          ), 
  
    ),
  
        ],
  
      ),
  
  Container(
  
  child: Text(list[index]["net"].toString()+list[index]["currency_symbol"].toString()),
  
  )
  
  ],
  
  ),
);

     },
    );

  },
),
  
    );

}
}