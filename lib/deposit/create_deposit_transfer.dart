import 'dart:convert';

import 'package:animated_dialog/AnimatedDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:fluttersipay/deposit/json_models/bank_list_model.dart';
import 'package:fluttersipay/deposit/json_models/bank_transfer_deposit_model.dart';
import 'package:fluttersipay/deposit/providers/bank_transfer_deposit_provider.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import '../base_main_repo.dart';
import 'deposit_success.dart';

class CreateBankTransferDepositScreen extends StatefulWidget {
  final BaseMainRepository mainRepo;
  final List userWallets;

  CreateBankTransferDepositScreen(this.mainRepo, this.userWallets);

  @override
  _CreateBankTransferDepositScreenState createState() =>
      _CreateBankTransferDepositScreenState();
}

class _CreateBankTransferDepositScreenState
    extends State<CreateBankTransferDepositScreen> {

var curency;

 List<String> curencies=["TRY","USD","EUR"];
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curency=curencies[0].toString();
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
    return ChangeNotifierProvider(
        create: (context) => DepositBankTransferProvider(
            widget.mainRepo,
            widget.userWallets,
            TextEditingController(),
            TextEditingController(),
            TextEditingController(),
            TextEditingController()),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/json/deposit/6.2Deposit_Transfer.json'),
            builder: (context, snapshot) {


              var parsedJson;
              if (snapshot.hasData) {


                return Scaffold(

/* 
floatingActionButton: FloatingActionButton(
  onPressed: (){    
  }
   ), */

                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(translator.translate("deposit")),
                    flexibleSpace: Image(
                      image: AssetImage('assets/appbar_bg.png'),
                      height: 100,
                      fit: BoxFit.fitWidth,
                    ),
                    leading: Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                          ),
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
                    //      size: 16,
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
                  body: Consumer<DepositBankTransferProvider>(
                      builder: (context, snapshot, _) {
/* 
                        snapshot.ibanController.text="TR14 0001 0009 1788 8886 2250 06";

                        snapshot.mainRepo.depositForm().then((value){
                                     //     snapshot.ibanController.text=bank.iban;
                                           snapshot.pnrController.text=value.data["randompnr"].toString();
  

                                              }); */


                    return Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(40),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text(
                             translator.translate("availableBalance"),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(50),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                        decoration: new BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.black54,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                   double.parse(snapshot.getAvailableWalletAmount(0).toString()).toStringAsFixed(2)+ '₺',
                            
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16),
                                          ),
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                        decoration: new BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.black54,
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            double.parse(snapshot.getAvailableWalletAmount(1).toString()).toStringAsFixed(2) +
                                                "\$",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16),
                                          ),
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                      double.parse(snapshot.getAvailableWalletAmount(2).toString()).toStringAsFixed(2) +
                                              '€',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil.getInstance().setHeight(70),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Container(height: 500,
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                      translator.translate("bankTrans")+" "+ translator.translate("deposit").toUpperCase(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(30),
                                            ),
                                            Text(
                                          translator.translate("youcan"),
                                              style: TextStyle(
                                                  color: Colors.black54, fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(50),
                                            ),
                                         //   Column(children:<Widget>[])
                                            Text(
                                                  translator.translate("bank"),
                                              style: TextStyle(
                                                  color: Colors.black54, fontSize: 12),
                                            ),
                                            snapshot.bankList != null
                                                ? DropdownButton<BankModel>(
                                                    icon: Icon(
                                                      Icons.keyboard_arrow_down,
                                                      size: 16,
                                                    ),
                                                    value:
                                                        snapshot.selectedDropDownValue,
                                                    items: snapshot.banksDropdown,
                                                    onChanged: (BankModel bank) {

                        snapshot.mainRepo.depositForm().then((value){

setState(() {
  
                                                    snapshot.ibanController.text=bank.iban;
                                                   snapshot.pnrController.text=value.data["randompnr"].toString();
  
});

                                                      });


                                                      print(bank.iban);
                                                      snapshot.selectedDropDownValue =
                                                          bank;

                                                    },
                                                    isExpanded: true,
                                                  )
                                                : SizedBox(
                                                    width: 0.0,
                                                  ),
                                            Form(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  SizedBox(
                                                    height: ScreenUtil.getInstance()
                                                        .setHeight(10),
                                                  ),
                                                  Text(
                                                            translator.translate("amount").toUpperCase(),
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12),
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment.end,
                                        
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: <Widget>[
                                                        Expanded(
                                                            child: TextFormField( inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
    ],
                                                     style: TextStyle(
                                                              color: Colors.black),
                                                          controller:
                                                              snapshot.amountController,
                                                          keyboardType:
                                                              TextInputType.number,
                                                          decoration: InputDecoration(
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color: Colors
                                                                                .black45,
                                                                            width:
                                                                                1.0)),
                                                       /*      suffix: Text(snapshot
                                                                     .bankCurrentCurrency ??
                                                                'TRY'), */
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color: Colors
                                                                                .black45,
                                                                            width:
                                                                                1.0)),
                                                            prefixIcon: const Icon(
                                                          FontAwesomeIcons.moneyBillWaveAlt,
                                                              size: 16,
                                                              color: Colors.black45,
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value.isEmpty) {
                                                              return          translator.translate("error")+         translator.translate("amount");
                                                            }
                                                            return null;
                                                          },
                                                        )),






     Container(
height:ScreenUtil.getInstance().setWidth(100) ,
                                              child: Padding(
                                                padding: const EdgeInsets.only(top:0.0),
                                                child: DropdownButton<String>(
                                                isDense: true,
                                                  icon: Icon(Icons.keyboard_arrow_down),
                                                  items: ["TRY","USD","EUR"]
                                                      .map<DropdownMenuItem<String>>(
                                                          (String value) {
                                                    return DropdownMenuItem<String>(
                                                      value: value,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                               //                 Icon(Icons.cur),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            child: Text(
                                                              value,style: TextStyle(color: Colors.grey),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (value) {
              setState(() {
                
curency=value;
int z=1;

if(curency==curencies[0])z=1; else if(curency==curencies[1])z=2; else if(curency==curencies[2])z=3;
                 snapshot.selectedDropDownValue.currencyID=z;
              });               

                                                  },
                                                  value: curency,
                                                  isExpanded: true,
                                                ),
                                              ),
                                              width: ScreenUtil.getInstance()
                                                  .setWidth(200),
                                            ),
                                            










//                                            SizedBox(
//                                              width: 20,
//                                            ),
//                                            Container(
//                                              decoration: new BoxDecoration(
//                                                border: Border(
//                                                  bottom: BorderSide(
//                                                    color: Colors.black54,
//                                                    width: 1.0,
//                                                  ),
//                                                ),
//                                              ),
//                                              child:
//                                                  DropdownButtonHideUnderline(
//                                                child: DropdownButton<String>(
//                                                  icon: Icon(
//                                                    Icons.keyboard_arrow_down,
//                                                    size: 16,
//                                                  ),
//                                                  items: users.trys.map<
//                                                          DropdownMenuItem<
//                                                              String>>(
//                                                      (String value) {
//                                                    return DropdownMenuItem<
//                                                        String>(
//                                                      value: value,
//                                                      child: Row(
//                                                        mainAxisAlignment:
//                                                            MainAxisAlignment
//                                                                .spaceBetween,
//                                                        children: <Widget>[
//                                                          SizedBox(width: 10),
//                                                          Expanded(
//                                                            child: Text(
//                                                              value,
//                                                              style: TextStyle(
//                                                                  color: Colors
//                                                                      .black45),
//                                                            ),
//                                                          )
//                                                        ],
//                                                      ),
//                                                    );
//                                                  }).toList(),
//                                                  onChanged: (value) {},
//                                                  //value: ,
//                                                  isExpanded: true,
//                                                ),
//                                              ),
//                                              width: 100,
//                                            ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: ScreenUtil.getInstance()
                                                        .setHeight(10),
                                                  ),
                                          /*         Text(
                                                    users.hintRegister,
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12),
                                                  ), */
                                                 
                                                 //Register
                   /*                        TextFormField(
                                        
                                                    style:
                                                        TextStyle(color: Colors.black),
                                                    controller:snapshot.receiverController,
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.black45,
                                                                  width: 1.0)),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors.black45,
                                                                  width: 1.0)),
                                                      prefixIcon: const Icon(
                                                        Icons.person,
                                                        size: 16,
                                                        color: Colors.black45,
                                                      ),
                                                      suffixIcon: IconButton(
                                                          icon: Icon(
                                                            Icons.collections_bookmark,
                                                            size: 16,
                                                          ),
                                                          onPressed: () {}),
                                                    ),
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Please enter REGISTER';
                                                      }
                                                      return null;
                                                    },
                                                    obscureText: false,
                                                  ),
                     */                      SizedBox(
                                                    height: ScreenUtil.getInstance()
                                                        .setHeight(10),
                                                  ),
                                                  Text(
         translator.translate("iban"),
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12),
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Expanded( 
                                                
                                                        child: TextFormField(
                                          enabled: false,
                                                          style:
                                                              TextStyle(color: Colors.black),
                                                          controller: snapshot.ibanController,
                                                          decoration: InputDecoration(
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Colors.black45,
                                                                        width: 1.0)),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Colors.black45,
                                                                        width: 1.0)),
                                                            prefixIcon: const Icon(
                                                              FontAwesomeIcons.hashtag,
                                                              color: Colors.black45,
                                                              size: 16,
                                                            ),
                                                
                                                          ),
                                                          validator: (value) {
                                                            if (value.isEmpty) {
                                                              return          translator.translate("error")+translator.translate("iban");
                                                            }
                                                            return null;
                                                          },
                                                          obscureText: false,
                                                        ),
                                                      ),
              
               IconButton(
                                                          icon: Icon(
                                                          
                                                            Icons.collections_bookmark,
                                                          color: Colors.blue,
                                                            size: 16,
                                                          ),
                                                          onPressed: () async{

 
   await Clipboard.setData(new ClipboardData(
   text:snapshot.ibanController.text));



                                    Scaffold.of(context).showSnackBar(SnackBar(
  duration: Duration(seconds: 3),
            content: Text("Copied to Clipboard")
));

                                                          }),
              
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: ScreenUtil.getInstance()
                                                        .setHeight(5),
                                                  ),
                                                  Text(
                                                     translator.translate("pnr"),
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12),
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Expanded(
                                                                                                          child: TextFormField(
                                                          enabled: false,
                                                          style:
                                                              TextStyle(color: Colors.black),
                                                          controller: snapshot.pnrController,
                                                          decoration: InputDecoration(
                                                            enabledBorder:
                                                                UnderlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Colors.black45,
                                                                        width: 1.0)),
                                                            focusedBorder:
                                                                UnderlineInputBorder(
                                                                    borderSide: BorderSide(
                                                                        color: Colors.black45,
                                                                        width: 1.0)),
                                                            prefixIcon: const Icon(
                                                              FontAwesomeIcons.hashtag,
                                                              color: Colors.black45,
                                                              size: 16,
                                                            ),

                                                          ),
                                                          validator: (value) {
                                                            if (value.isEmpty) {
                                                              return 'Please enter PNR';
                                                            }
                                                            return null;
                                                          },
                                                          obscureText: false,
                                                        ),
                                                      ),
                                                 
                                                 
                                                 
                                                 IconButton(
                                                                icon: Icon(
                                                                  Icons.collections_bookmark,
                                                                  size: 16,
                                                                  color: Colors.blue,
                                                                ),
                                                                onPressed: ()async {

 
 await Clipboard.setData(new ClipboardData(
   text:snapshot.pnrController.text));



                                    Scaffold.of(context).showSnackBar(SnackBar(
  duration: Duration(seconds: 3),
            content: Text("Copied to Clipboard")
)); 
                                                                }),                                                 
                                                 
                                                 
                                                 
                                                 
                                                 
                                                 
                                                 
                                                 
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: ScreenUtil.getInstance()
                                                        .setHeight(10),
                                                  ),
                                                  Visibility(
                                                    visible:
                                                        snapshot.depositErrorText !=
                                                            null,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                          snapshot.depositErrorText ??
                                                              '',
                                                          style: TextStyle(
                                                              color: Colors.red[800],
                                                              fontSize: 14),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              ScreenUtil.getInstance()
                                                                  .setHeight(15),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  
                                                  SizedBox(
                                                    height: ScreenUtil.getInstance()
                                                        .setHeight(0),
                                                  ),
                                        
                                        
                                        
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                   Container(
                                                    child:
                                                     FlatButton(
                                                      
                                                      onPressed: () {




                                                      snapshot.createDeposit(
                                                            (successModel) {


return


 showDialog(context: context,
   
    child: AnimatedDialog(

      width:MediaQuery.of(context).size.width-70, //final width of the dialog
      height: MediaQuery.of(context).size.width-70, //final height of the dialog
     // durationTime: Duration(seconds: 1),

      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
      child: Center(
        child: Container(//width: 200,height: 200,
          child: Column(
children: <Widget>[



Image.asset("assets/confirm.png",),



Text(
        "Deposit Amount: "+snapshot.amountController.text+" "+ this.curency.toString()??"",textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
        textScaleFactor: 1.2,
      ),


Text(
        "if the amount is not sent within 24 hours,\n transaction will be canceled",
        textScaleFactor: 1.1,
        style: TextStyle(color:Colors.grey),
        textAlign: TextAlign.center,
      ),
SizedBox(height: 20,),
Row(mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[

FlatButton(
  
  shape: Border.all(width: 0.5 ,color:Colors.grey),
  onPressed: (){Navigator.pop(context);}, child:Text("Cancel" , style: TextStyle(color:Colors.grey),)

) ,
SizedBox(width: 10,),
        FlatButton(
         child:Text("Confirm",style: TextStyle(color:Colors.white),),
          color: Colors.indigo,
          onPressed: (){

  
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    DepositSuccessScreen(
                                                                        successModel),
                                                              ));
                                                        }),
                                         
       
          
  ],
)
],

          )
        ),
      ),


    )
  );

   
                                                            });




                                                      },
                                                      color: Colors.blue,
                                                      disabledColor: Colors.blue,
                                                      padding: EdgeInsets.all(15.0),
                                                      child: Text(
                                                              translator.translate("submit"),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                    width: ScreenUtil.getInstance()
                                                        .setWidth(690),
                                                  ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        LoadingWidget(
                          isVisible: snapshot.showLoad ?? false,
                        )
                      ],
                    );
                  }),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }));
  }
}
