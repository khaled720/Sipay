import 'package:flutter/material.dart';
import 'package:fluttersipay/Witdrawal/json_models/withdrawal_bank_model.dart';
import 'package:fluttersipay/deposit/json_models/bank_list_model.dart';
import 'package:intl/intl.dart';

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

  static String mapCurrencyIDToCurrencySign(int currencyID) {
    switch (currencyID) {
      case 1:
        return '₺';
        break;
      case 2:
        return '\$';
        break;
      case 3:
        return '€';
        break;
    }
    return '';
  }

  static String mapMoneyFlowToColorType(String flowSign) {
    switch (flowSign) {
      case '+':
        return '1';
      case '-':
        return '0';
      default:
        return '2';
    }
  }

  static replaceNullItemsToEmptyValues(var item) =>
      item == null ? 'Not Found' : item;

  static String getDateRangeBetweenTwoDates(DateTime date1, DateTime date2) =>
      '${formatTimeOfDayToYYYYMMDD(date1)} - ${formatTimeOfDayToYYYYMMDD(date2)}';

  static String formatTimeOfDayToYYYYMMDD(DateTime date) =>
      DateFormat('yyyy/MM/dd').format(date);

  static int mapTransactionStateToIndex(String state) {
    switch (state) {
      case 'Completed':
        return 1;
      case 'Rejected':
        return 2;
      case 'Pending':
        return 3;
      default:
        return 0;
    }
  }

  static double calculateFee(double amount, List commissions, int index) {
    double total =
        (((amount / 100) * commissions[index]['commission_percentage']) +
            commissions[index]['commission_amount']);
    return total;
  }

  static List<DropdownMenuItem<WithdrawalBankModel>>
      mapWithdrawalBankListToDropdownMenuItems(List banks) {
    List<DropdownMenuItem<WithdrawalBankModel>> dropdownBanks = List();
    for (WithdrawalBankModel bank in banks) {
      DropdownMenuItem dropdownMenuItem = DropdownMenuItem<WithdrawalBankModel>(
        value: bank,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.note),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                bank.name,
              ),
            )
          ],
        ),
      );
      dropdownBanks.add(dropdownMenuItem);
    }
    return dropdownBanks;
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
