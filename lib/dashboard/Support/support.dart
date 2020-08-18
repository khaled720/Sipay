import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';
import 'dart:ui' as ui;
import 'package:flushbar/flushbar.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_provider/country_provider.dart' as pc; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/utils/api_endpoints.dart' as global;
import 'package:http/http.dart' as http;
import 'package:fluttersipay/corporate/global_data.dart';
class support extends StatefulWidget {
support(this.ticket);
  var ticket;
  @override
  _supportState createState() => _supportState();
}

class _supportState extends State<support> {
 var liss=[1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10];
 TextEditingController message=new TextEditingController() ;
var _future;
  @override
  Widget build(BuildContext context) {
_future=http.get(
global.APIEndPoints.kApiSupportConvesationEndPoint+"/${widget.ticket['ticket_id']}"
,headers: {
"Authorization":userToken,
"Accept":"application/json"
}, );



    return Scaffold(
         appBar: AppBar(
              centerTitle: true,
              title: Text("SUPPORT",style: TextStyle(fontSize: 15),),
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




    body:     Container(
     
     margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
      
      
      
        crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

Text("#"+widget.ticket["ticket_id"].toString()+" "+widget.ticket["title"].toString() ,
style: TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold),)

,


SizedBox(height: 20,),

Row(

  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
        Text(widget.ticket["ticketcategory_id"]==null?"Other":widget.ticket["ticketcategory"]["name"],
    
    style: TextStyle(
    
      fontSize: 10,
    
      color: Colors.grey),),
 
 
 
 
 Column(
crossAxisAlignment: CrossAxisAlignment.end,
   children: <Widget>[

   Text("Created on:",
    
    style: TextStyle(
    
      fontSize: 10,
    
      color: Colors.grey),),
 
    Text(widget.ticket["created_at"],
    
    style: TextStyle(
    
      fontSize: 10,
    
      color: Colors.grey),),
 
 

   ],
 )
 
 
 
  ],
),







Expanded(
  child:   Container(
  
  child:

FutureBuilder(
  future:_future
  ,
 
  builder: (BuildContext context, AsyncSnapshot snapshot){

if(!snapshot.hasData)return Center(child: CircularProgressIndicator());
     var responseMap=json.decode(snapshot.data.body); 
     var list=responseMap["data"]["conversations"];

    return Container(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {

     var date = DateTime.tryParse( list[index]["created_at"]);

        return Container(
          color: list[index]["messagefrom"]=="CUSTOMER"?Colors.grey[200]:Colors.grey[100],
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
       
          child: Column(
            crossAxisAlignment: list[index]["messagefrom"]=="CUSTOMER"?
            CrossAxisAlignment.end:CrossAxisAlignment.start,
            children: <Widget>[
    
     Text(list[index]["message"].toString()
     ,style: TextStyle(
       fontWeight: FontWeight.w500,
       color: Colors.grey[700]
       //fontFamily: "cursive"
       ),
     
     ),
     Text(

       date.hour.toString()=="0" ?

    "0"+date.hour.toString()+':'+date.minute.toString()+" | "+
  DateFormat("MMMMd").format(date).toString()
 :
date.hour.toString()+':'+date.minute.toString()+" | "+
  DateFormat("MMMMd").format(date).toString()
 ,
 style: TextStyle(
fontSize:10,
color: Colors.grey
 ),
   ),


            ],
          ));
   
       },
      )

    );
  },
),


  
  
  
  ),
),






TextFormField(
controller: message,
  decoration: InputDecoration(
prefixIcon: Icon(FontAwesomeIcons.comment),

hintText: "Type your message here..."


),
)
,

SizedBox(height: 0,),
        Center(
                child: Container(
      margin: EdgeInsets.only(top:20),
                  width: (MediaQuery.of(context).size.width/3)*2.8,
      
                  child: FlatButton(
      
          
      
            padding: EdgeInsets.all(15.0),
      
          
      
            child: Text(

                  'SEND',
   
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
       ),
       ),
          
            color: Colors.blue,
      
            onPressed: () {
          
        if(message.value.text.isEmpty){

             Flushbar(
                    message:'Please Enter a message to send',
                    duration: Duration(seconds: 3),
                     )..show(context);
        }else{

 http.post(
global.APIEndPoints.kApiSupportCreateConversationEndPoint+"/${widget.ticket['ticket_id']}"
,headers: {

"Authorization":userToken,
"Accept":"application/json"



},
body:{
"message":message.value.text,


}

).then((value) {

setState(() {
  _future=http.get(
global.APIEndPoints.kApiSupportConvesationEndPoint+"/${widget.ticket['ticket_id']}"
,headers: {
"Authorization":userToken,
"Accept":"application/json"
}, );
message.text="";
});

})
;


        
      
          
      








        }
      
          
      





      
            },
      
          
      
          ),
      
                ),
              ),
      

        Center(
                child: Container(
      margin: EdgeInsets.only(top:10),
                  width: (MediaQuery.of(context).size.width/3)*2.8,
      
                  child: FlatButton(
      
          
      
            padding: EdgeInsets.all(15.0),
      
          
      
            child: Text(
      
          
      
                  'CLOSE TICKET',
      
          
      
                  style: TextStyle(
      
          
      
                    color: Colors.white,
      
          
      
                    fontSize: 16,
      
          
      
                  ),
      
          
      
            ),
      
          
      
            color: Colors.red[900],
      
          
      
            onPressed: () {
      
          // NAVIGATE TO ADD TICKET SCREEN
      
          print("Pressd " +widget.ticket['ticket_id'].toString() );
      http.get(
global.APIEndPoints.kApiTicketCloseEndPoint+"${widget.ticket['id']}"
,headers: {
"Authorization":userToken,
"Content-Type":"application/json",
"Accept":"application/json"
}, ).then((value) {
     Flushbar(
                                  
                                    message: "This Ticket has been Closed",
                                    duration: Duration(seconds: 2),
                                  )..show(context);
Timer(Duration(seconds:2),(){
Navigator.pop(context);
});
 

print(value.body);


}



);
          



      
            },
      
          
      
          ),
      
                ),
              ),

/* 
StreamBuilder<Object>(
  stream: null,
  builder: (context, snapshot) {
      return     ListView.builder(
      
        itemCount: 1,
      
        itemBuilder: (BuildContext context, int index) {
      
        return ;
      
       },
      
      );
  }
), */



        ],
      
      ),
    ),
    );
  }
}