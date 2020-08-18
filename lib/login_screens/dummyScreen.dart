import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_provider/country_provider.dart' as pc; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class dummy extends StatefulWidget {
  @override
  _dummyState createState() => _dummyState();
}

class _dummyState extends State<dummy> {
 var liss=[1,2,3,4,5,6,7,8,9,10,1,2,3,4,5,6,7,8,9,10];
var listOfTickets=[];
var currency;

   Widget DropDown(List data)
      {
        if(data!=null)
        {
          return DropdownButtonFormField(
            onSaved: (val){
if(val!=null){


 currency=val;//int.parse(val.toString());


}else{
/* 
currency=""; */


}

            },/* 
            validator: (val){


if(val==null)

            }, */
            items: data.map((item) {
              return new DropdownMenuItem(
                child: new Text(
                  item,
                  style: TextStyle(fontSize: 14.0),
                ),
                value: item.toString(),
              );
            }).toList(),
            hint: Text(
              "Please Select ",
              style: TextStyle(
                color: Colors.black45,
              ),),
            onChanged: (newVal) {
              setState(() {
              currency = newVal;//int.parse(newVal);
          
            //    customerid = newVal;
           //   print('customrid:' + newVal.toString());
              });
            },
        //    value: _mySelection,
          );
      }
      else{
        return new Center(
         child: CircularProgressIndicator(),
        );
        }
      }

  @override
  Widget build(BuildContext context) {
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

Text("#Ticket Id",
style: TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold),)

,


SizedBox(height: 20,),

Row(

  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
        Text("CATEGORY",
    
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
 
    Text("25-10-2015 - 12:00",
    
    style: TextStyle(
    
      fontSize: 10,
    
      color: Colors.grey),),
 
 

   ],
 )
 
 
 
  ],
),







Expanded(
  child:   Container(
  
  //child: ,
  
  
  child: ListView.builder(
    itemCount: liss.length,
    itemBuilder: (BuildContext context, int index) {
    return Text(liss[index].toString());
   },
  ),
  color: Colors.amber,
  
  
  
  ),
),


Center(
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text("Ticket has been closed",
    
    style: TextStyle(
    
    //  fontSize: 15,
    
    color: Colors.grey
    
    ),),
  ),
)

,

SizedBox(height: 0,),
        Center(
                child: Container(
      margin: EdgeInsets.only(top:5),
                  width: (MediaQuery.of(context).size.width/3)*2.8,
      
                  child: FlatButton(
      
          
      
            padding: EdgeInsets.all(15.0),
      
          
      
            child: Text(
      
          
      
                  'OPEN NEW TICKET',
      
          
      
                  style: TextStyle(
      
          
      
                    color: Colors.white,
      
          
      
                    fontSize: 16,
      
          
      
                  ),
      
          
      
            ),
      
          
      
            color: Colors.blue,
      
          
      
            onPressed: () {
      
          // NAVIGATE TO ADD TICKET SCREEN
      
          print("Pressd");
      
          
      
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