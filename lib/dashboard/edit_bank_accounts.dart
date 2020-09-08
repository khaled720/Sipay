import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/dashboard/Live_support.dart';
import 'package:fluttersipay/dashboard/providers/add_bank_account_provider.dart';
import 'package:fluttersipay/utils/dialog_utils/delete_bank_account_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import 'dart:convert';
import 'package:fluttersipay/utils/api_endpoints.dart' as global;
import 'package:http/http.dart' as http;
import '../avaliable_banks_model.dart';
import '../base_main_repo.dart';
import '../loading_widget.dart';

class EditBankAccountScreen extends StatefulWidget {
  final bankModel;
  final BaseMainRepository baseRepo;

  EditBankAccountScreen(this.bankModel, this.baseRepo);

  @override
  _EditBankAccountScreenState createState() => _EditBankAccountScreenState();
}

class _EditBankAccountScreenState extends State<EditBankAccountScreen> {
 
var xx= translator.translate("currency");
List<String> list=[];
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list=json.decode(xx);
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
        create: (context) => AddBankAccountProvider(
            widget.baseRepo,
            TextEditingController(),
            TextEditingController(),
            TextEditingController(),
            widget.bankModel),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(translator.translate("edit")),
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
          body:
              Consumer<AddBankAccountProvider>(builder: (context, snapshot, _) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.only(right: 30.0, left: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil.getInstance().setHeight(30),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            child: Text(
                             translator.translate("editBank"),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                DeleteBankAccountDialog.showDeleteDialog(
                                    context, () {
                                  snapshot.deleteBankAccount(() {
                                    Navigator.of(context).pop();
                                    Flushbar(
                                      title: translator.translate("success"),
                         
                                      message:  translator.translate("deleted"),
                                      duration: Duration(seconds: 3),
                                    )..show(context);
                                  }, (description) {
                                    Flushbar(
                                      title: translator.translate("fail"),
                                      message: description,
                                      duration: Duration(seconds: 3),
                                    )..show(context);
                                  });
                                });
                              },
                              alignment: Alignment.centerRight,
                              icon: Icon(
                                FontAwesomeIcons.trash,
                                color: const Color(0xFFc14b6f),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
            translator.translate("accName"),
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        controller: snapshot.accountNameTextController,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black45, width: 1.0)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black45, width: 1.0)),
                          prefixIcon: const Icon(
                            FontAwesomeIcons.signature,
                            size: 16,
                            color: Colors.black45,
                          ),
                        ),
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        translator.translate("bank"),
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      snapshot.bankList != null
                          ? DropdownButton<AvailableBankModel>(
                              icon: Icon(Icons.keyboard_arrow_down),
                              items: snapshot.banksDropDown,
                              onChanged: (bank) {
                                snapshot.selectedBankDropDownValue = bank;
                              },
                              value: snapshot.selectedBankDropDownValue,
                              isExpanded: true,
                            )
                          : SizedBox(
                              width: 0.0,
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        translator.translate("curr"),
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black26,
                          ),
                          items: snapshot.currenciesList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.map,
                                    size: 18,
                                    color: Colors.black38,
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
                            snapshot.selectedCurrencyDropDownValue = value;
                          },
                          value: snapshot.selectedCurrencyDropDownValue,
                          isExpanded: true,
                        ),
                        width: ScreenUtil.getInstance().setWidth(300),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        translator.translate("accHolder"),
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      TextField(
                        style: TextStyle(color: Colors.black),
                        controller: snapshot.accountHolderNameController,
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
                        ),
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        translator.translate("bank"),
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      TextField(
                                inputFormatters: [
        LengthLimitingTextInputFormatter(20),
      ],
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
                            size: 16,
                            color: Colors.black45,
                          ),
                        ),
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        translator.translate("state"),
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                      Container(
                        child: DropdownButton<String>(
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black26,
                          ),
                          items: snapshot.activeList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Icon(
                                    Icons.map,
                                    color: Colors.black38,
                                    size: 18,
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
                            snapshot.selectedActiveDropDownValue = value;
                          },
                          value: snapshot.selectedActiveDropDownValue,
                          isExpanded: true,
                        ),
                        width: ScreenUtil.getInstance().setWidth(300),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: snapshot.addBankErrorText != null,
                        child: Column(
                          children: <Widget>[
                            Text(
                              snapshot.addBankErrorText ?? '',
                              style: TextStyle(
                                  color: Colors.red[800], fontSize: 14),
                            ),
                            SizedBox(
                              height: ScreenUtil.getInstance().setHeight(30),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: FlatButton(
                          onPressed: () {

/* 

if(
  snapshot.accountHolderNameController.text!=""
  &&
  snapshot.accountNameTextController.text!=""
  &&
  snapshot.selectedCurrencyDropDownValue!=""
  &&
  snapshot.ibanController.text!=""
  &&
  snapshot.selectedActiveDropDownValue!=""
  )
{
  
  



}else{
  
   print("A8a");

   
  
  }


 */






                             snapshot.editBankAccount((description) {
                              Navigator.of(context).pop();
                              Flushbar(
                                title: translator.translate("success"),
                                message: description,
                                duration: Duration(seconds: 3),
                              )..show(context);
                            }, (description) {
                              Flushbar(
                                title: translator.translate("fail"),
                                message: description,
                                duration: Duration(seconds: 3),
                              )..show(context);
                            }); 
                          },
                          color: Colors.blue,
                          disabledColor: Colors.blue,
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            translator.translate("save"),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        width: ScreenUtil.getInstance().setWidth(690),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )),
                LoadingWidget(
                  isVisible: snapshot.showLoad ?? false,
                )
              ],
            );
          }),
        ));
  }
}
