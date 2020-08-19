import 'dart:convert';

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

var curency="TRY";

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


              BankTransferModel users;
              var parsedJson;
              if (snapshot.hasData) {


                parsedJson = json.decode(snapshot.data.toString());
                users = BankTransferModel.fromJson(parsedJson);
                return Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    title: Text(users.header),
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
                          size: 16,
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
                                height: ScreenUtil.getInstance().setHeight(50),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 30, right: 30),
                                child: Text(
                                  users.abailable,
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
                                            snapshot.getAvailableWalletAmount(
                                                    0) +
                                                '₺',
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
                                            snapshot.getAvailableWalletAmount(
                                                    1) +
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
                                          snapshot.getAvailableWalletAmount(2) +
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
                                              users.description,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(30),
                                            ),
                                            Text(
                                              users.youcan,
                                              style: TextStyle(
                                                  color: Colors.black54, fontSize: 16),
                                            ),
                                            SizedBox(
                                              height: ScreenUtil.getInstance()
                                                  .setHeight(50),
                                            ),
                                         //   Column(children:<Widget>[])
                                            Text(
                                              users.hintBank,
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
                                                    users.hintAmount,
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
                                                              return 'Please enter AMOUNT';
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

if(curency=="TRY")z=1; else if(curency=="USD")z=2; else if(curency=="EUR")z=3;
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
                                                   // initialValue: "A7a",
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
                                                    users.hintIban,
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12),
                                                  ),
                                                  TextFormField(
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
                                                      suffixIcon: IconButton(
                                                          icon: Icon(
                                                            Icons.collections_bookmark,
                                                            size: 16,
                                                          ),
                                                          onPressed: () {}),
                                                    ),
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Please enter IBAN';
                                                      }
                                                      return null;
                                                    },
                                                    obscureText: false,
                                                  ),
                                                  SizedBox(
                                                    height: ScreenUtil.getInstance()
                                                        .setHeight(10),
                                                  ),
                                                  Text(
                                                    users.hintPNR,
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 12),
                                                  ),
                                                  TextFormField(
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
                                                      suffixIcon: IconButton(
                                                          icon: Icon(
                                                            Icons.collections_bookmark,
                                                            size: 16,
                                                          ),
                                                          onPressed: () {}),
                                                    ),
                                                    validator: (value) {
                                                      if (value.isEmpty) {
                                                        return 'Please enter PNR';
                                                      }
                                                      return null;
                                                    },
                                                    obscureText: false,
                                                  ),
                                                  SizedBox(
                                                    height: ScreenUtil.getInstance()
                                                        .setHeight(30),
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
                                                                  .setHeight(30),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  
                                                  SizedBox(
                                                    height: ScreenUtil.getInstance()
                                                        .setHeight(30),
                                                  ),
                                        
                                        
                                        
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                   Container(
                                                    child: FlatButton(
                                                      onPressed: () {




                                                      snapshot.createDeposit(
                                                            (successModel) {
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) =>
                                                                    DepositSuccessScreen(
                                                                        successModel),
                                                              ));
                                                        });
                                                      },
                                                      color: Colors.blue,
                                                      disabledColor: Colors.blue,
                                                      padding: EdgeInsets.all(15.0),
                                                      child: Text(
                                                        users.button,
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
