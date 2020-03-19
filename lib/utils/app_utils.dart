import 'package:flutter/material.dart';
import 'package:fluttersipay/deposit/json_models/bank_list_model.dart';

class AppUtils {
  static String getTransactionableType(String type) {
    List splittedString = type.split('\\');
    if (splittedString.length >= 3) {
      if (splittedString[2] == 'Send' || splittedString[2] == 'Receive')
        return 'Money Transfer';
      return splittedString[2];
    }
    return type;
  }

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

  static List<DropdownMenuItem<BankModel>> mapBankListToDropdownMenuItems(
      List<BankModel> banks) {
    List<DropdownMenuItem<BankModel>> dropdownBanks = List();
    for (BankModel bank in banks) {
      DropdownMenuItem dropdownMenuItem = DropdownMenuItem<BankModel>(
        value: bank,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.note,
              size: 16,
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
