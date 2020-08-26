import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';
import 'dart:ui' as ui;
import 'dart:convert';
import 'package:fluttersipay/utils/api_endpoints.dart' as global;
import 'package:http/http.dart' as http;
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_provider/country_provider.dart' as pc; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class new_ticket extends StatefulWidget {
  @override
  _new_ticketState createState() => _new_ticketState();
}

class _new_ticketState extends State<new_ticket> {
 
var listOfTickets=[];
var category,category_ID=8;
TextEditingController title=new TextEditingController();
TextEditingController desc=new TextEditingController();
File  _image;var isUploading=false;
   Widget DropDown(List data)
      {
        if(data!=null)
        {
          return DropdownButtonFormField(
            onSaved: (val){
if(val!=null){


 category=val;//int.parse(val.toString());


}else{
/* 
category=""; */


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
              category = newVal;//int.parse(newVal);
          
  switch (newVal) {
    case "Deposit": category_ID=2;
      break;


    case "Withdraw": category_ID=3;
      break;



    case "Refund": category_ID=6;
      break;

   case "Money Transfer": category_ID=10;
      break;
   case "Technical": category_ID=7;
      break;
   case "Purchase": category_ID=9;
      break;
   case "Other": category_ID=8;
      break;


    
  }
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
              title: Text("NEW TICKET",style: TextStyle(fontSize: 15),),
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




    body:      SingleChildScrollView(
          child: Container(
       
       margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
        
        
        
          crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

Text("Open New Support Ticket",
style: TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold),)

,


SizedBox(height: 20,),

Text("CATEGORY",
style: TextStyle(
  fontSize: 10,
  color: Colors.grey),),
DropDown(["Deposit","Withdraw","Refund","Technical","Other","Purchase","Money Transfer"])
,
//Deposit Withdraw Refund Technical Other Purchase Money Transfer
SizedBox(height: 20,),
Text("Title",
style: TextStyle(
  fontSize: 10,
  color: Colors.grey),),
TextFormField(
controller: title,
  decoration: InputDecoration(
//prefixIcon: Icon(FontAwesomeIcons.commentDots),

hintText: "Ticket Title"

  ),


)

,


                Center(
                  child: Container(
        margin: EdgeInsets.symmetric(vertical:20),
                    width: (MediaQuery.of(context).size.width/3)*1.8,
        
                    child: FlatButton(
        
            
        
              padding: EdgeInsets.all(15.0),
        
            
        
              child: Text(
        
            
        
                    isUploading?"Uploading File...":'Attach File',
        
            
        
                    style: TextStyle(
        
            
        
                      color: Colors.white,
        
            
        
                      fontSize: 16,
        
            
        
                    ),
        
            
        
              ),
        
            
        
              color: Colors.blue,
        
            
        
              onPressed: ()async {
        
            // NAVIGATE TO ADD TICKET SCREEN
        
            print("Pressd");


// ignore: deprecated_member_use
var image = await ImagePicker.pickImage(source:ImageSource.gallery );


setState(() {
  this._image=image;
});

        
            
        
              },
        
            
        
            ),
        
                  ),
                ),
        


Text("DESCRIPTION",
style: TextStyle(
  fontSize: 10,
  color: Colors.grey),),

TextFormField(
controller: desc,
  decoration: InputDecoration(
prefixIcon: Icon(FontAwesomeIcons.commentDots),

hintText: "Go ahead we're listening..."

  ),
)

,


          Center(
                  child: Container(
        margin: EdgeInsets.symmetric(vertical:40),
                    width: (MediaQuery.of(context).size.width/3)*2.8,
        
                    child: FlatButton(
        
            
        
              padding: EdgeInsets.all(15.0),
        
            
        
              child: Text(
        
            
        
                    'SUBMIT',
        
            
        
                    style: TextStyle(
        
            
        
                      color: Colors.white,
        
            
        
                      fontSize: 16,
        
            
        
                    ),
        
            
        
              ),
        
            
        
              color: Colors.blue,
        
            
        
              onPressed: () {


  String base64Image = base64Encode(_image.readAsBytesSync());

print(base64Image.toString());

        
      if(title.value.text.isEmpty||desc.value.text.isEmpty){

             Flushbar(
      // title: "Eror",
                                          message:
                                              'Some fields are empty !!',
                     duration: Duration(seconds: 3),
                                        )..show(context);
      }else{

http.post(

global.APIEndPoints.kApiSupportFormEndPoint
,headers:{

"Authorization":userToken
,
"Accept":"application/json"
,
},
body: {
  
"title":title.text
,
"message":desc.text
,
"category":category_ID.toString()
,
"attachment":base64Image

},
//encoding: Encoding.getByName("form-data")

).then((val){

var body=json.decode(val.body);
Timer(Duration(seconds: 3),(){
Navigator.pop(context);
});

print("NEW TICKET RESPONSE: "+val.body.toString());
if(body['statuscode']==100)
{



             Flushbar(
      title: "Success",
                                          message:
                      'Your Support Ticket was opened successfully',
                     duration: Duration(seconds: 3),
                                        )..show(context);
}else{

          Flushbar(
       title: "Fail",
                                          message:
                      'Your Support Ticket was not opened successfully',
                     duration: Duration(seconds: 3),
                                        )..show(context);

}


});





      }
        
            
        
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
    ),
    );
  }
}