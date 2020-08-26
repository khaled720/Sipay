import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fluttersipay/corporate/deposit/json_models/c_bank_list_model.dart';
import 'package:websafe_svg/websafe_svg.dart';

class C_AppUtils {

  static String mapCurrencyIDToText(int currencyID) {
    switch (currencyID) {
      case 1:
        return 'TRY';
        break;
      case 2:
        return 'USD';
        break;
      case 3:
        return 'EUR';
        break;
    }
    return '';
  }
  static int mapCurrencyTextToID(String currency) {
    switch (currency) {
      case 'TRY':
        return 1;
        break;
      case 'USD':
        return 2;
        break;
      case 'EUR':
        return 3;
        break;
    }
    return 1;
  }
  static List<DropdownMenuItem<CorporateBankModel>> mapBankListToDropdownMenuItems(
      List<CorporateBankModel> banks) {
    List<DropdownMenuItem<CorporateBankModel>> dropdownBanks = List();
    for (CorporateBankModel bank in banks) {
      DropdownMenuItem dropdownMenuItem = DropdownMenuItem<CorporateBankModel>(
        value: bank,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(child: WebsafeSvg.network(bank.logo??"",width: 40,height: 25)
       ,   width: 40,
          ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                bank.bankName,
              ),
            )
          ],
        ),
      );
      dropdownBanks.add(dropdownMenuItem);
    }
    return dropdownBanks;
  }
}