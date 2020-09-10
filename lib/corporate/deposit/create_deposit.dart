import 'dart:convert';

import 'package:animated_dialog/AnimatedDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/corporate/dashboard/support.dart';
import 'package:fluttersipay/corporate/deposit/json_models/c_bank_list_model.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:fluttersipay/corporate/deposit/providers/corporate_create_deposit_provider.dart';
import 'deposit_success.dart';
import 'package:localize_and_translate/localize_and_translate.dart';



class C_Create_deposits extends StatefulWidget {
  final BaseMainRepository mainRepo;
  final List userWallets;
  final List<DropdownMenuItem<CorporateBankModel>> _banksDropDown;
  final CorporateBankModel _selectedBankDropDownValue;
  C_Create_deposits(this.mainRepo, this.userWallets, this._banksDropDown, this._selectedBankDropDownValue);
  @override
  _Create_panel createState() => _Create_panel();
}

class _Create_panel extends State<C_Create_deposits> {

  List<String> _listtryData = ["TRY", "USD", 'EUR'];

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
      create: (context) => Corporate_CreateDepositProvider(
        widget.mainRepo,
        widget.userWallets,
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        widget._banksDropDown,
        widget._selectedBankDropDownValue
      ),
      child: FutureBuilder(
          future: DefaultAssetBundle.of(context)
  .loadString('assets/json/deposit/6.2Deposit_Transfer.json'),
          builder: (context, snapshot) {
            transfer_json users;
            var parsedJson;
            if (snapshot.hasData) {
              parsedJson = json.decode(snapshot.data.toString());
              users = transfer_json.fromJson(parsedJson);
         
              return Scaffold(
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
                body:Consumer<Corporate_CreateDepositProvider>(
                  builder: (context, snapshot, _) {
                    return  Stack(
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
                         translator.translate("availableBalance"),
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
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
                                                color: Colors.black54, fontSize: 16),
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
                                       
                                                      
                            double.parse(snapshot.getAvailableWalletAmount(1).toString()).toStringAsFixed(2)+ "\$",
                                            style: TextStyle(
                                                color: Colors.black54, fontSize: 16),
                                          ),
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                   
                                                      
                            double.parse(snapshot.getAvailableWalletAmount(2).toString()).toStringAsFixed(2)+'€',
                                          style: TextStyle(
                                              color: Colors.black54, fontSize: 16),
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
                                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                             translator.translate("bankTrans")+" "+translator.translate("deposit").toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance().setHeight(30),
                                    ),
                                    Text(
                                      users.youcan,
                                      style:
                                      TextStyle(color: Colors.black54, fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance().setHeight(50),
                                    ),
                                    Text(
                                     translator.translate("bank"),
                                      style:
                                      TextStyle(color: Colors.black54, fontSize: 12),
                                    ),
                                    snapshot.bankList != null
                                        ? DropdownButton<CorporateBankModel>(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 16,
                                      ),
                                      value: snapshot.selectedDropDownValue,
                                      items: snapshot.banksDropdown,
                                      onChanged: (CorporateBankModel bank) {
                                        snapshot.selectedDropDownValue =
                                            bank;

                                            setState(() {
                                        snapshot.ibanController.text=bank.iban;
                                              
                                            });
                                  
                                      },
                                      isExpanded: true,
                                    )
                                        : SizedBox(
                                      width: 0.0,
                                    ),
                                    Form(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height:
                                            ScreenUtil.getInstance().setHeight(10),
                                          ),
                                          Text(
                                            translator.translate("amount")+"*",
                                            style: TextStyle(
                                                color: Colors.black54, fontSize: 12),
                                          ),
                                          Container(
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: <Widget>[
                                                Expanded(
                                                    child: TextFormField(
                                                      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
    ],
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                      controller: snapshot.amountController,
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(
                                                        enabledBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                Colors.black45,
                                                                width: 1.0)),
                                                        focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                Colors.black45,
                                                                width: 1.0)),
                                                        prefixIcon: const Icon(
                                                          Icons.map,
                                                          size: 16,
                                                          color: Colors.black45,
                                                        ),
                                                      ),
                                                      validator: (value) {
                                                        if (value.isEmpty) {
                                                          return translator.translate("error")+translator.translate("amount");
                                                        }
                                                        return null;
                                                      },
                                                      obscureText: false,
                                                    )
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  decoration: new BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: Colors.black54,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: DropdownButtonHideUnderline(
                                                    child: DropdownButton<String>(
                                                      icon: Icon(
                                                        Icons.keyboard_arrow_down,
                                                        size: 16,
                                                      ),
                                                      items: _listtryData
                                                          .map<DropdownMenuItem<String>>(
                                                              (String value) {
                                                            return DropdownMenuItem<String>(
                                                              value: value,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: <Widget>[
                                                                  SizedBox(width: 10),
                                                                  Expanded(
                                                                    child: Text(
                                                                      value,
                                                                      style: TextStyle(
                                                                          color:
                                                                          Colors.black45),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          }).toList(),
                                                      onChanged: (value) {
                                                        setState(() {
                                                          snapshot.selectedCurrencyDropdownValue =
                                                              value;
                                                        });
                                                      },
                                                      value: snapshot
                                                          .selectedCurrencyDropDownValue,
                                                      isExpanded: true,
                                                    ),
                                                  ),
                                                  width: 100,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                            ScreenUtil.getInstance().setHeight(10),
                                          ),
                                          Text(
                                           translator.translate("register").toUpperCase(),
                                            style: TextStyle(
                                                color: Colors.black54, fontSize: 12),
                                          ),
                                          TextFormField(
                                            style: TextStyle(color: Colors.black),
                                            controller: snapshot.receiverController,
                                            decoration: InputDecoration(
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black45, width: 1.0)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black45, width: 1.0)),
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
                                                return translator.translate("error")+""+translator.translate("register").toUpperCase();
                                              }
                                              return null;
                                            },
                                            obscureText: false,
                                          ),
                                          SizedBox(
                                            height:
                                            ScreenUtil.getInstance().setHeight(10),
                                          ),
                                          Text(
                                           translator.translate("iban"),
                                            style: TextStyle(
                                                color: Colors.black54, fontSize: 12),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                                                              child: TextFormField(
                                                  style: TextStyle(color: Colors.black),
                                                  controller: snapshot.ibanController,
                                                  decoration: InputDecoration(
                                                    enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black45, width: 1.0)),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black45, width: 1.0)),
                                                    prefixIcon: const Icon(
                                                      FontAwesomeIcons.hashtag,
                                                      color: Colors.black45,
                                                      size: 16,
                                                    ),
                                          
                                                  ),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return translator.translate("error")+translator.translate("iban");
                                                    }
                                                    return null;
                                                  },
                                                  obscureText: false,
                                                ),
                                              ),
                                          
                                          
                                          IconButton(
                                                        icon: Icon(
                                                          Icons.collections_bookmark,
                                                       color: Colors.blue,  // size: 16,
                                                        ),
                                                        onPressed: () async {

 await Clipboard.setData(new ClipboardData(
   text:snapshot.ibanController.text));



                                    Scaffold.of(context).showSnackBar(SnackBar(
  duration: Duration(seconds: 3),
            content: Text(translator.translate("copied"))
));

                                                        }),
                                          
                                          
                                          
                                          
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                            ScreenUtil.getInstance().setHeight(10),
                                          ),
                                          Text(
                                          translator.translate("pnr"),
                                            style: TextStyle(
                                                color: Colors.black54, fontSize: 12),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                                                              child: TextFormField(
                                                  style: TextStyle(color: Colors.black),
                                                  controller: snapshot.pnrController,
                                                  decoration: InputDecoration(
                                                    enabledBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black45, width: 1.0)),
                                                    focusedBorder: UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.black45, width: 1.0)),
                                                    prefixIcon: const Icon(
                                                      FontAwesomeIcons.hashtag,
                                                      color: Colors.black45,
                                                      size: 16,
                                                    ),
                                    
                                                  ),
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return translator.translate("error")+translator.translate("pnr");
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
                                                                  ),
                                                        onPressed: ()async{



 await Clipboard.setData(new ClipboardData(
   text:snapshot.pnrController.text));



                                    Scaffold.of(context).showSnackBar(SnackBar(
  duration: Duration(seconds: 3),
            content: Text(translator.translate("copied"))
));



                                                        }),
                                            ],
                                          ),
                                          SizedBox(
                                            height:
                                            ScreenUtil.getInstance().setHeight(30),
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
                                          Container(
                                            child: FlatButton(
                                              onPressed: () {



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
    translator.translate("deposit")+ " "   +translator.translate("ant")+": "+snapshot.amountController.text+" "+ snapshot.selectedCurrencyDropDownValue .toString()??"",textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
        textScaleFactor: 1.2,
      ),


Text(
       translator.translate("depositDialogHint"),
        textScaleFactor: 1.1,
        style: TextStyle(color:Colors.grey),
        textAlign: TextAlign.center,
      ),
SizedBox(height: 20,),
Row(mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[

FlatButton(
  
  shape: Border.all(width: 0.5 ,color:Colors.grey),
  onPressed: (){Navigator.pop(context);}, child:Text(translator.translate("cancel") , style: TextStyle(color:Colors.grey),)

) ,
SizedBox(width: 10,),
        FlatButton(
         child:Text(translator.translate("conf"),style: TextStyle(color:Colors.white),),
          color: Colors.indigo,
          onPressed: (){

                                                snapshot.createDeposit(

                                                        (successModel) {



                                                           Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                C_Deposit_success(
                                                                    successModel
                                                                    ),
                                                          ));

 

   











                                             
                                                    });
  
                                                        }),
                                         
       
          
  ],
)
],

          )
        ),
      ),


    )
  );


//                                                      Navigator.pushReplacement(
//                                                          context,
//                                                          MaterialPageRoute(
//                                                            builder: (context) =>
//                                                                C_Deposit_success(
//                                                                ),
//                                                          ));
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
                                            width: ScreenUtil.getInstance().setWidth(690),
                                          ),
                                          SizedBox(
                                            height:
                                            ScreenUtil.getInstance().setHeight(30),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        LoadingWidget(
                          isVisible: snapshot.showLoad ?? false,
                        )
                      ],
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

class transfer_json {
  String header;
  String abailable;
  List<String> abailableBalances;
  String description;
  List<String> bankname;
  String youcan;
  String hintBank;
  String hintAmount;
  List<String> trys;
  String hintRegister;
  String hintIban;
  String hintPNR;
  String button;

  transfer_json(
      {this.header,
        this.abailable,
        this.abailableBalances,
        this.description,
        this.bankname,
        this.youcan,
        this.hintBank,
        this.hintAmount,
        this.trys,
        this.hintRegister,
        this.hintIban,
        this.hintPNR,
        this.button});

  transfer_json.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    description = json['description'];
    bankname = json['bankname'].cast<String>();
    youcan = json['youcan'];
    hintBank = json['hint_bank'];
    hintAmount = json['hint_amount'];
    trys = json['trys'].cast<String>();
    hintRegister = json['hint_register'];
    hintIban = json['hint_iban'];
    hintPNR = json['hint_PNR'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['description'] = this.description;
    data['bankname'] = this.bankname;
    data['youcan'] = this.youcan;
    data['hint_bank'] = this.hintBank;
    data['hint_amount'] = this.hintAmount;
    data['trys'] = this.trys;
    data['hint_register'] = this.hintRegister;
    data['hint_iban'] = this.hintIban;
    data['hint_PNR'] = this.hintPNR;
    data['button'] = this.button;
    return data;
  }
}
