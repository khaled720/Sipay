import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:fluttersipay/corporate/payment/dpl_details.dart';
import 'package:fluttersipay/corporate/payment/dql_passivedetail.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttersipay/utils/api_endpoints.dart' as global;
import 'package:fluttersipay/corporate/global_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Dpl_History_Panel extends StatefulWidget {
  Dpl_History_Panel({Key key}) : super(key: key);
  @override
  _Dpl_History_Panel createState() => _Dpl_History_Panel();
}

class _Dpl_History_Panel extends State<Dpl_History_Panel> {


GlobalKey<ScaffoldState> _key=new GlobalKey<ScaffoldState>();
List activeList=new List();
List passiveList=new List();
bool activeload=false;
bool passiveload=false;

getActiveHistory()async{
Map active={};

setState(() {
  activeload=true;
});
await http.get(
  global.APIEndPoints.activeApi ,headers:{
"Accept":"application/json",	
"Content-Type":"application/json",
"Authorization":userToken
}).then((res){

String body=res.body.toString();
 active=json.decode(body);
setState(() {
activeList= active['data']['dpldata']['data'];
//xx.add(active['data']['dpldata']['data']);
    activeload=false;
});






});


}


getPassiveHistory()async{




Map passive={};

setState(() {
 passiveload=true;
});

await http.get(
  global.APIEndPoints.passiveApi ,headers:{
"Accept":"application/json",	
"Content-Type":"application/json",
"Authorization":userToken
}).then((res){

String body=res.body.toString();
 passive=json.decode(body);
setState(() {
passiveList= passive['data']['dpldata']['data'];


  passiveload=false;

});


});




print("###############3Pasive###########"+passive.toString());



}




@override
void initState() { 
  super.initState();
  getActiveHistory();
  getPassiveHistory();
}










  bool incoming_state =true;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
//getActiveHistory();

    print("############Active History############# = "+
    activeList.runtimeType.toString()+"  "+this.activeList.toString());

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
    ScreenUtil(width: 750, height: 1304, allowFontScaling: true)
      ..init(context);
    return Scaffold(key: _key,
        appBar: AppBar(
          centerTitle: true,
          title: Text("DPL HISTORY"),
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
                            
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Live_Support(),
                                          ));
                                    
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: IntrinsicWidth(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              decoration: new BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    //                   <--- left side
                                    color: incoming_state ? Colors.blue : Colors.black26,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                    width: ScreenUtil.getInstance().setWidth(345),
                                    child: OutlineButton(
                                      onPressed: _updateincoming,
                                      borderSide: new BorderSide(
                                        style: BorderStyle.none,
                                      ),
                                      child: new Text(
                                        'ACTIVE',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: incoming_state
                                                ? Colors.blue
                                                : Colors.black26,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              decoration: new BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    //                   <--- left side
                                    color: incoming_state ? Colors.black26 : Colors.blue,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: ScreenUtil.getInstance().setWidth(345),
                                  child: OutlineButton(
                                    onPressed: _updateincoming,
                                    borderSide: new BorderSide(
                                      style: BorderStyle.none,
                                    ),
                                    child: new Text(
                                      'PASSIVE',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: incoming_state
                                              ? Colors.black26
                                              : Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                width: ScreenUtil.getInstance().setWidth(750),
                height: ScreenUtil.getInstance().setHeight(80),
              ),
              SizedBox(
                height: 30,
              ),
      
          activeload==true||passiveload==true?      
            Container(
              
              height: MediaQuery.of(context).size.height/1.5,
              
              child: Center(child: CircularProgressIndicator())):        Container(
                child:incoming_state?
                
                
            activeList.length==0?Container(
              
              height: MediaQuery.of(context).size.height/1.5,
              
              child: Center(child: Text("No Data To Display")))
             :   ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: activeList.length,
                  primary: true,
                  itemBuilder: (BuildContext content, int index){
                  
                  String text=activeList[index]["type"]==1?"One Time Link":"Multi Time Link";
              String title="#"+activeList[index]["id"].toString()+"-"+text;
          return      GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => Dpl_detail_Panel(map:activeList[index]) ,
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),
                              ),
                            ),
                            Text(
                           activeList[index]['is_amount_set_by_user']==1? "Set by User"
                                     :
                           activeList[index]['amount'].toString() +" "+activeList[index]["currencies"]['code'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                               ,   fontSize: 13
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
                              child: Text(
                                  "CREATED"
                              ),
                            ),
                            Text(
                           activeList[index]['created_at'].toString(),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  "EXPIRY"
                              ),
                            ),
                            Text(
                          activeList[index]["type"]==1?activeList[index]['expire_date'].toString():
    
    activeList[index]["expire_date"].toString().replaceFirst("00:", activeList[index]["expire_time"].toString()+":"),
                              textAlign: TextAlign.right,
                            )
                          ],
                        )
                      ],
                    ),
                    padding: EdgeInsets.only(right: 10),
                  ),
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: InkWell(

                          onTap: ()async{
await Clipboard.setData(new ClipboardData(text:global.APIEndPoints.dplLink+  activeList[index]['token'].toString()));


_key.currentState.showSnackBar(SnackBar(
  duration: Duration(seconds: 2),
          content: Text("DPL Link Copied")
));


                          },
                                                  child: Icon(
                            FontAwesomeIcons.solidCopy,
                            color: Colors.grey,
                            size: 18,
                          ),
                        ),
                        width: 35,
                      ),
                      Container(
                        child: Icon(
                          FontAwesomeIcons.trashAlt,
                          color: Colors.black,
                          size: 18,
                        ),
                        width: 35,
                      ),
                    ],
                  ),
                  width: 70,
                )
          
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black45,
            height: 1.0,
          )
        ],
      ),
    );
               
               
               
                }
                )
                
                :
                //Passive
           passiveList.length==0?Container(
              
              height: MediaQuery.of(context).size.height/1.5,
              
              child: Center(child: Text("No Data To Display")))
             :  ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: passiveList.length,
                  primary: true,
                  itemBuilder: (BuildContext content, int index){
                  
                  String text=passiveList[index]["type"]==1?"One Time Link":"Multi Time Link";
              String title="#"+passiveList[index]["id"].toString()+"-"+text;


          return      GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => Dpl_Passivedetal_Panel(map:passiveList[index]),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                ),
                              ),
                            ),
                            Text(
                            passiveList[index]['is_amount_set_by_user']==1? "Set by User"
                                     :
                           passiveList[index]['amount'].toString() +" "+passiveList[index]["currencies"]['code'].toString(),
                           style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ,    fontSize: 13
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
                              child: Text(
                                  "CREATED"
                              ),
                            ),
                            Text(
                           passiveList[index]['created_at'].toString(),
                              textAlign: TextAlign.right,
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  "EXPIRY"
                              ),
                            ),
                            Text(
                          passiveList[index]['type']==1?passiveList[index]['expire_date']: passiveList[index]["expire_date"].toString().replaceFirst("00:", passiveList[index]["expire_time"].toString()+":"),
                                
                              textAlign: TextAlign.right,
                            )
                          ],
                        )
                      ],
                    ),
                    padding: EdgeInsets.only(right: 10),
                  ),
                ),
      
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black45,
            height: 1.0,
          )
        ],
      ),
    );
               
               
               
                }
                ),
              ),
            ],
          ),
        )
    );
  }


  void _updateincoming() {
    setState(() {
      incoming_state = ! incoming_state;
    });
  }

}
