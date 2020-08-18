import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'merchant_panel.dart';

TextEditingController _search_controller = new TextEditingController();

Widget Help_detail() {
  return Help_detail_Panel();
}

class Help_detail_Panel extends StatefulWidget {
  Help_detail_Panel({Key key}) : super(key: key);
  @override
  _Help_detail_Panel createState() => _Help_detail_Panel();
}

class _Help_detail_Panel extends State<Help_detail_Panel> {
  
  List<String> help_list = [
    "What is SiPay?",//1
    "Is it paid to use SiPay?",
    "How do I use it?",//2
    "What can I do with SiPay Wallet?",
    "What is My Desposit Limit?",//3
    "Can I Make Deposit 24/7?",//4
    "How do I deposit money to my SiPay wallet by bank transfer?",
    "How do I deposit money to my wallet with my credit card?",
    "What should I do if money is not transferred to my account?",
    "Can someone send money to my wallet?"
  ];
var expandList=[0,0,0,0,0,0,0,0,0,0];
var help_list2=[],list2=[],expandList2=[];
var list=[
"The easy, fast and secure way of payment, SiPay, is Turkey's youngest new generation of digital wallets with permission to operate as it receives Electronic Money Institution Licence in July 2019 from the Banking Regulation and Supervision Agency.",
"Our users do not pay any membership fees to benefit from our services.",
"To use SiPay, you only need to enter the one-time password that sends to your mobile phone. Create your special wallet account, enjoy easy and secure shopping.",
"As a digital wallet owner, you can shop from all of our merchants, send money to any person, ask other users to transfer money to your wallet, convert your money in your SiPay wallet account to foreign currency, or even withdraw money from the bank account that you&#39;ve defined. ",
"If you're a Standard Account user, you can't deposit money, but you can keep 750,00 TRY sent to you from another user in your wallet.If you are a Verified Account user, you can deposit 50.000 TRY, if you have a Contracted Account you can deposit 250.000 TRY.",
"You can deposit money to your SiPay wallet with your credit card or by bank transfer 24/7.",
"Log into your SiPay account and enter the amount you&#39;d like to deposit on the Deposit page, select Bank Transfer as your payment method. Select the SiPay account to which you want to send money from the drop-down menu and press Send.",
"After logging into your SiPay wallet account, enter the amount you&#39;d like to deposit on the Deposit page and select Credit Card as your payment method. In the menu that opens, enter your card information completely and accurately. Press send. Once you enter your security password, your balance will be added to your account instantly",
"When making a transfer, make sure you meet all the criteria we have specified, especially check if you have entered your PNR code correctly. If you are sure of all of us, please call us at 0212 706 11 12."
,"All users with a verified SiPay account can send money to your wallet."

];
@override
  void initState() {
    // TODO: implement initState
    
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1304, allowFontScaling: true)
          ..init(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("HELP"),
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
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "F.A.Q",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Describe Your issue"),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    color: Colors.white,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            style: TextStyle(color: Colors.black),
                            controller: _search_controller,
                        onSubmitted: (txt){
if(txt.isNotEmpty){

  help_list2=[];expandList2=[];list2=[];
for(int i=0;i<help_list.length;i++){

if(help_list[i].toLowerCase().contains(txt.toLowerCase())){
setState(() {
  help_list2.add(help_list[i]);
list2.add(list[i]);
expandList2.add(0);

});


}

}
}



                        },
                        
                                                    keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                FontAwesomeIcons.search,
                                color: Colors.black26,
                                size: 16,
                              ),
                              hintText: "can I put money in my wallet?",
                              hintStyle:
                                  TextStyle(color: Colors.black26, height: 1.3),
                            ),
                            obscureText: false,
                          ),
                  _search_controller.value.text.isEmpty?   Container(
                            child: new ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: help_list.length,
                              primary: true,
                              itemBuilder: (BuildContext content, int index) {
                                return detail_list(help_list[index],list[index],index: index);
                              },
                            ),
                          ):Container(
child:
new ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: help_list2.length,
                              primary: true,
                              itemBuilder: (BuildContext content, int index) {
                                return detail_list2(help_list2[index],list2[index],index: index);
                              },
                            ),


                          )
                        ],
                      )),
                  SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
            Dashboardbottom(context, null, null, null),
          ],
        ));
  }
 
  Widget detail_list(String help_list,String answer,{int index}) {
   
    return new Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    help_list,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(


onTap: (){
setState(() {


  if(expandList[index]==1){
expandList[index]=0;

  }else{

expandList[index]=1;
  }
});

print("Tapped");

},

                                      child: Icon(
                      expandList[index]==0?Icons.add:Icons.minimize,
                    ),
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          width: double.infinity,
        ),
        SizedBox(
          height: 10,
        ),





AnimatedContainer(
  duration: Duration(seconds: 2),
//height: expandList[index]==0?0:150,
//color: Colors.amber,
child: Card(
  elevation: 0,
  child:
  expandList[index]==1?Container(
    margin: EdgeInsets.all(5),
    child: Text(answer,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey[700]),)):null

),


)



      ],
    );
  }





Widget detail_list2(String help_list,String answer,{int index}) {
   
    return new Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    help_list,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(


onTap: (){
setState(() {


  if(expandList2[index]==1){
expandList2[index]=0;

  }else{

expandList2[index]=1;
  }
});

print("Tapped");

},

                                      child: Icon(
                      expandList2[index]==0?Icons.add:Icons.minimize,
                    ),
                  ),
                )
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          width: double.infinity,
        ),
        SizedBox(
          height: 10,
        ),





AnimatedContainer(
  duration: Duration(seconds: 2),
//height: expandList[index]==0?0:150,
//color: Colors.amber,
child: Card(
  elevation: 0,
  child:
  expandList2[index]==1?Container(
    margin: EdgeInsets.all(5),
    child: Text(answer,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.grey[700]),)):null

),


)



      ],
    );
  }

}
