import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';

class ActivityDetailsScreen extends StatefulWidget {
  
  var map;
 
  ActivityDetailsScreen({this.map});

  @override
  _ActivityDetailsScreenState createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
var body;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


      print("#####99####"+widget.map.toString());
      body=json.decode(widget.map);

  }
  @override
  Widget build(BuildContext context) {

 
    return Scaffold(
       


  appBar: AppBar(
              centerTitle: true,
              title: Text('ACTIVITY DETAILS'),
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
  height: MediaQuery.of(context).size.height-50,
  child:   Column(
  
    children: <Widget>[
  
          Expanded(
  
                    child: ListView(
  
      
  
      
  
      
  
        children: <Widget>[
  
      
  
      
    Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text("Transaction ID",style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
       // isThreeLine: true,
  
     /*    subtitle: Text("A7a"),
  
        title:Text("xcxz"), */
  
        trailing: Text("#"+body["transactionable_id"],
  
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
  
        leading: Text("Order ID",style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),

  
        trailing: Text(body["transactionable_type"].toString().replaceAll("App\Models\\", "")??"Not Found",
  
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
  
        leading: Text("Payment ID",style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
       // isThreeLine: true,
  
     /*    subtitle: Text("A7a"),
  
        title:Text("xcxz"), */
  
        trailing: Text("#"+body["payment_id"]??"Not Found",
  
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
  
      
  
        trailing: Text("#"+body["transactionable_id"],
  
        style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.black,fontWeight: FontWeight.bold),
  
        ),
  
        ),
  
      ), */
  
      
  
      
  
      Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text("Entity Name",style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
       // isThreeLine: true,
  
     /*    subtitle: Text("A7a"),
  
        title:Text("xcxz"), */
  
        trailing: Container(width: 180,
          child: Text(body["entity name"]??"Not Found",
  
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
  
        leading: Text("Amount",style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
       // isThreeLine: true,
  
     /*    subtitle: Text("A7a"),
  
        title:Text("xcxz"), */
  
        trailing: Text(body["net"].toString()+body["currency_symbol"].toString(),
  
        style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.black,fontWeight: FontWeight.bold),
  
        ),
  
        ),
  
      ),
  
      
  
      Padding(
  
        padding: const EdgeInsets.all(0),
  
        child: ListTile(   
  
        leading: Text("Date",style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.grey,fontWeight: FontWeight.bold),),
  
       // isThreeLine: true,
  
     /*    subtitle: Text("A7a"),
  
        title:Text("xcxz"), */
  
        trailing: Text(body["created_at"]??"Not Found",
  
        style: TextStyle(
  
          fontSize: 15,
  
          color: Colors.black,fontWeight: FontWeight.bold),
  
        ),
  
        ),
  
      ),
  
      
  
    
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
      
  
        ],
  
      
  
      ),
  
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