import 'dart:async';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:fluttersipay/utils/api_endpoints.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ola_like_country_picker/ola_like_country_picker.dart';
import 'dart:ui' as ui;
import 'dart:convert';
import 'package:dio/dio.dart' as dio ;
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
                 translator.translate("categoryHint"),
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
//////////////////////////////////////////////////////////
  
  
  
  
  
  File image;
  
upload2Image(File image,context) async {
  try {
      ///[1] CREATING INSTANCE
      var dioRequest = dio.Dio();

      dioRequest.options.baseUrl = 
           global.APIEndPoints.kApiSupportFormEndpoint;

      //[2] ADDING TOKEN
      dioRequest.options.headers = {
        'Accept':"application/json",
        'Authorization': userToken,
        'Content-Type': 'application/x-www-form-urlencoded'
      };

      //[3] ADDING EXTRA INFO
       var formData = new dio.FormData.fromMap({
         "title":title.text
,
"message":desc.text
,
"category":category_ID.toString()

       });
 
      //[4] ADD IMAGE TO UPLOAD
      var file = await dio.MultipartFile.fromFile(image.path,
            filename: basename(image.path),
            contentType: MediaType("attachment", basename(image.path)));

      formData.files.add(MapEntry('attachment', file));

      //[5] SEND TO SERVER
      var response = await dioRequest.post(
        APIEndPoints.kApiCorporateUploadImageEndPoint,
        data: formData,
        options: dio.Options(
          headers: {       'Accept':"application/json",
        'Authorization': userToken,}
        )
      );
      final result = json.decode(response.toString())['data'];
    //  print("<<<<<<<<<<<<><<<<<<<<<<   "+result.toString());
    
     Flushbar(
                                      title: "Successful",
                                      message: 'Image Uploaded!',
                                      duration: Duration(seconds: 3))
                                    ..show(context);
    } catch (err) {
     // print('ERROR  $err');
      Flushbar(
                                      title: "Failure",
                                      message: 'Image was not Uploaded!',
                                      duration: Duration(seconds: 3))
                                    ..show(context);
    }
}



  
  
  
  
  
  
  
  /////////////////////////////////////////
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

Text(     translator.translate("newTic"),
style: TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold),)

,


SizedBox(height: 20,),

Text(     translator.translate("categoryTic"),
style: TextStyle(
  fontSize: 10,
  color: Colors.grey),),
DropDown(["Deposit","Withdraw","Refund","Technical","Other","Purchase","Money Transfer"])
,
//Deposit Withdraw Refund Technical Other Purchase Money Transfer
SizedBox(height: 20,),
Text(     translator.translate("titleTic"),
style: TextStyle(
  fontSize: 10,
  color: Colors.grey),),
TextFormField(
controller: title,
  decoration: InputDecoration(
//prefixIcon: Icon(FontAwesomeIcons.commentDots),

hintText:      translator.translate("ticketTichint"),

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
        
            
        
                 translator.translate("attachTic"),
        
            
        
                    style: TextStyle(
        
            
        
                      color: Colors.white,
        
            
        
                      fontSize: 16,
        
            
        
                    ),
        
            
        
              ),
        
            
        
              color: Colors.blue,
        
            
        
              onPressed: () async{
        
            // NAVIGATE TO ADD TICKET SCREEN
        
            print("Pressd2");
        
                 // ignore: deprecated_member_use
             image= await   ImagePicker.pickImage(source: ImageSource.gallery);
        
              },
        
            
        
            ),
        
                  ),
                ),
        


Text(     translator.translate("desc").toUpperCase(),
style: TextStyle(
  fontSize: 10,
  color: Colors.grey),),

TextFormField(
controller: desc,
  decoration: InputDecoration(
prefixIcon: Icon(FontAwesomeIcons.commentDots),

hintText:      translator.translate("descTicHint"),

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
        
            
        
                         translator.translate("submit").toUpperCase(),
        
            
        
                    style: TextStyle(
        
            
        
                      color: Colors.white,
        
            
        
                      fontSize: 16,
        
            
        
                    ),
        
            
        
              ),
        
            
        
              color: Colors.blue,
        
            
        
              onPressed: () async {
        
      if(title.value.text.isEmpty||desc.value.text.isEmpty){

             Flushbar(
      // title: "Eror",
                                          message:
                                              'Some fields are empty !!',
                     duration: Duration(seconds: 3),
                                        )..show(context);
      }else{






try
{
 
      var dioRequest = dio.Dio();

      dioRequest.options.baseUrl = 
           global.APIEndPoints.kApiSupportFormEndpoint;
 
      dioRequest.options.headers = {
        'Accept':"application/json",
        'Authorization': userToken,
        'Content-Type': 'application/x-www-form-urlencoded'
      };

       var formData = new dio.FormData.fromMap({
         "title":title.text
,
"message":desc.text
,
"category":category_ID.toString()

       });
 
      if(image!=null){
      var file = await dio.MultipartFile.fromFile(image.path,
            filename: basename(image.path),
            contentType: MediaType("attachment", basename(image.path)));

      formData.files.add(MapEntry('attachment', file));
      }
      var response = await dioRequest.post(
       global.APIEndPoints.kApiSupportFormEndpoint,
        data: formData,
        options: dio.Options(
          headers: {       'Accept':"application/json",
        'Authorization': userToken,}
        )
      );
      final result = json.decode(response.toString());
      print("<<<<<<<<<<<<><##<<<<<<<<<   "+result.toString());
    
     Flushbar(
                                      title: "Successful",
                                      message: 'Your Support Ticket was opened successfully',
                                      duration: Duration(seconds: 3))
                                    ..show(context);
                                    desc.text="";title.text="";
setState(() { 
  category=null;
image=null;category_ID=null;
});
    } catch (err) {
     // print('ERROR  $err');
      Flushbar(
                                      title: "Failure",
                                      message: 'Your Support Ticket was not opened !!',
                                      duration: Duration(seconds: 3))
                                    ..show(context);
    }










/* 
http.post(

global.APIEndPoints.kApiSupportFormEndpoint
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

},


).then((val){

var body=json.decode(val.body);
Timer(Duration(seconds: 3),(){
Navigator.pop(context);
});
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
 */




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