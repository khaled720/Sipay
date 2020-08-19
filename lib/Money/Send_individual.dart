import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Money/Send_corp.dart';
import 'package:fluttersipay/Money/providers/send_to_individual_provider.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart' as translator;
import '../base_main_repo.dart';
import 'money_transfer_otp.dart';
import 'dart:ui' as ui;
import 'package:ola_like_country_picker/ola_like_country_picker.dart' as ola;
import 'package:country_pickers/country_pickers.dart';
import 'package:country_provider/country_provider.dart';
class SendMoneyToIndividualScreen extends StatefulWidget {
  final BaseMainRepository baseMainRepository;
  final List wallets;

  SendMoneyToIndividualScreen(this.baseMainRepository, this.wallets);














  @override
  _SendMoneyToIndividualScreenState createState() =>
      _SendMoneyToIndividualScreenState();
}

class _SendMoneyToIndividualScreenState
    extends State<SendMoneyToIndividualScreen> {
  bool check_state = true;
  bool check_states = true;
  List<String> _listBankData = ["INDIVIDUAL","MERCHANT"];
  List<String> _listtryData = ["TRY", "USD", 'EUR'];




 ola.CountryPicker countryPicker;
 ola.Country country ;// se
  String countrycode;

 var local = ui.window.locale.countryCode ;

@override
  void initState() {
    // TODO: implement initState
    super.initState();


for(var element in ola.countryCodes){
if(local.toLowerCase()==element["ISO"]){
  setState(() {
    
country = ola.Country.fromJson(element); 

  });
}
}
   countryPicker = ola.CountryPicker(
     onCountrySelected: (country) {
      print(country);
      setState(() {
        this.country =country as ola.Country ;
     countrycode=country.dialCode;
      });

   });


//  if(widget.remem==null) widget.remem=false;

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
        create: (context) => SendMoneyToIndividualProvider(
            widget.baseMainRepository,
            widget.wallets,
            TextEditingController(),
            TextEditingController(),
            TextEditingController(),
            UserTypes.Individual),
        child: Scaffold(floatingActionButton: FloatingActionButton.extended(
       // shape: ,
          label:Text("SEND REQUEST") ,
          onPressed: (){} ,),
          appBar: AppBar(
            centerTitle: true,
            title: Text("Money  Transfer"),
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
          body: Consumer<SendMoneyToIndividualProvider>(
              builder: (context, snapshot, _) {
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
                          'AVAILABLE BALANCE',
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
                                    snapshot.getAvailableWalletAmount(0) + '₺',
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
                                    snapshot.getAvailableWalletAmount(1) + "\$",
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
                                  snapshot.getAvailableWalletAmount(2) + '€',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(80),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'REQUEST MONEY',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(50),
                            ),
                            Text(
                              'CHOOSE WALLET TYPE',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                            DropdownButton<String>(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                size: 16,
                              ),
                              items: _listBankData
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.wallet,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                          value,
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {

if(value=="MERCHANT"){    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SendMoneyToCorporateScreen(
                widget.baseMainRepository,
                widget.wallets,
                UserTypes.Individual),
          ));}

                              },
                              value: 'INDIVIDUAL',
                              isExpanded: true,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(50),
                                ),
                             /*    Text(
                                  'PHONE NO',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ), */


                                  Text(
                                  'Sender Phone Number',
                                  style: TextStyle(
                                      color: check_state
                                          ? Colors.black54
                                          : Colors.red,
                                      fontSize: 12),
                                ),
                                Row(
                                  children: <Widget>[
                             
                             
                                                            GestureDetector(
                              
                                    child: Container(
                              
                                      margin:EdgeInsets.only(top:20),
                              
                                      width: 70,
                              
                                      height: 30,
                              
                                      child: Row(
                              
                              
                              
                                        children: <Widget>[
                              
                              
                              
                                    Image.asset(country.flagUri, package: 'ola_like_country_picker',width: 30,height: 27,),
                              
                                   Expanded(child: Text("+"+country.dialCode,
                              
                                   style: TextStyle(fontWeight: FontWeight.bold),
                              
                                   overflow: TextOverflow.fade,))
                              
                              
                              
                                        ],
                              
                                      ),
                              
                                      
                              
                                    ),
                              
                                    onTap: () {
                         
                                      countryPicker.launch(context);
                                 if(snapshot.receiverController.text.contains("+")){

snapshot.receiverController.text="";                              
                            }
                                    },
                              
                                  ),
                                    Expanded(
                                                                          child: TextFormField(
                                        
                                        style: TextStyle(color: Colors.black),
                                        keyboardType: TextInputType.phone,
                                        controller: snapshot.receiverController,
                                        onFieldSubmitted: (value) {
                                          snapshot.onReceiverPhoneSubmitted("+"+countrycode+value);
                                        },
                                  /*       inputFormatters: [maskFormatter], */
                                        decoration: InputDecoration(
                                     //   labelText: "",
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black45, width: 1.0)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black45, width: 1.0)),
                                /*           prefixIcon: snapshot.phoneLoading
                                              ? CupertinoActivityIndicator()
                                              : Icon(
                                                  Icons.phone,
                                                  size: 16,
                                                  color: Colors.black45,
                                                ), */
                                        ),
                                        obscureText: false,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(10),
                                ),
                                Visibility(
                                  visible: snapshot.receiverData != null,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                          snapshot.receiverData ==
                                                  'Non SiPay User'
                                              ? FontAwesomeIcons.userTimes
                                              : FontAwesomeIcons.userCheck,
                                          size: 15.0,
                                          color: snapshot.receiverData ==
                                                  'Non SiPay User'
                                              ? Colors.red
                                              : Colors.blue),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        snapshot.receiverData ?? '',
                                        style: TextStyle(
                                            color: snapshot.receiverData ==
                                                    'Non SiPay User'
                                                ? Colors.red
                                                : Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(40),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: check_states
                                        ? Container(
                                            child: Text(
                                              '',
                                              style: TextStyle(
                                                color: Colors.black38,
                                              ),
                                            ),
                                            height: 0,
                                          )
                                        : RichText(
                                            textAlign: TextAlign.right,
                                            text: TextSpan(
                                                // set the default style for the children TextSpans
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    wordSpacing: 3),
                                                children: [
                                                  WidgetSpan(
                                                    child: Icon(
                                                      FontAwesomeIcons
                                                          .userCheck,
                                                      size: 14,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                      text:
                                                          ' AIGERIM KAIROLDAYEVA',
                                                      style: TextStyle(
                                                          color: Colors.blue)),
                                                ])),
                                  ),
                                ),
                                Text(
                                  'AMOUNT',
                                  style: TextStyle(
                                      color: check_state
                                          ? Colors.black54
                                          : Colors.red,
                                      fontSize: 12),
                                ),
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: TextFormField(
                                           inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
    ],
                                          style: TextStyle(
                                              color: check_state
                                                  ? Colors.black
                                                  : Colors.red),
                                          keyboardType: TextInputType.number,
                                          controller: snapshot.amountController,
                                          onChanged: (text) {
                                            if (text.length > 0 &&
                                                !check_state) {
                                              setState(() {
                                                check_state = true;
                                              });
                                            }
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black45,
                                                    width: 1.0)),
                                            prefixIcon: check_state
                                                ? const Icon(
                                                    FontAwesomeIcons.moneyBillWaveAlt,
                                                    size: 16,
                                                    color: Colors.black45,
                                                  )
                                                : const Icon(
                                                    Icons.cancel,
                                                    size: 16,
                                                    color: Colors.red,
                                                  ),
                                          ),
                                          obscureText: false,
                                        ),
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
                                              snapshot.selectedCurrencyDropdownValue =
                                                  value;
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
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 120),
                                  child: check_state
                                      ? Container(
                                          height: 0,
                                        )
                                      : Container(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "Please enter valid amount",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(20),
                                ),
                                Text(
                                  'DESCRIPTION',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 12),
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  keyboardType: TextInputType.text,
                                  controller: snapshot.descriptionController,
                                  decoration: InputDecoration(
                                    hintText: "Enter Description",
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black45, width: 1.0)),
                                    prefixIcon: const Icon(
                                      FontAwesomeIcons.solidCommentDots,
                                      color: Colors.black45,
                                      size: 16,
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter DESCRIPTION';
                                    }
                                    return null;
                                  },
                                  obscureText: false,
                                ),
                                SizedBox(
                                  height:
                                      ScreenUtil.getInstance().setHeight(50),
                                ),
                                Container(
                                  child: FlatButton(
                                    onPressed: () {
                                      if(!snapshot.receiverController.text.contains("+")){
 snapshot.receiverController.text="+"+countrycode+ snapshot.receiverController.text;
 //phoneNumber= snapshot.receiverController.text;
                                      }

                                      snapshot.moneyTransfer((phoneNumber,
                                          otpModel, mainRepo, userType) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MoneyTransferOTPScreen(
                                                        phoneNumber,
                                                        otpModel,
                                                        userType,
                                                        mainRepo,
                                                        false)));
                                      }, (description) async{
                           var txt=  await translator.GoogleTranslator().translate(description, to: 'en');
   
                                        print("======_"+description.toString());
                                        Flushbar(
                                          title: "Failure",
                                          message: txt,
                                          duration: Duration(seconds: 3),
                                        )..show(context);
                                      });
                                    },
                                    color: Colors.blue,
                                    disabledColor: Colors.blue,
                                    padding: EdgeInsets.all(15.0),
                                    child: Text(
                                      "SUBMIT REQUEST",
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
                                      ScreenUtil.getInstance().setHeight(40),
                                ),
                              ],
                            )
                          ],
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
        ));
  }
}
