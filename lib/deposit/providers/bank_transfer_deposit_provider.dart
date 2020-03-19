import 'package:flutter/material.dart';
import 'package:fluttersipay/deposit/json_models/bank_list_model.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/transactions_screen_base_provider.dart';
import 'package:fluttersipay/utils/app_utils.dart';

import '../../base_main_repo.dart';

class DepositBankTransferProvider extends TransactionsScreenBaseProvider {
  List<BankModel> _bankList;
  List<DropdownMenuItem<BankModel>> _banksDropDown;
  BankModel _selectedBankDropDownValue;
  String _selectedCurrencyDropDownValue;
  TextEditingController _amountController;
  TextEditingController _registerController;
  TextEditingController _ibanController;
  TextEditingController _pnrController;

  BankModel get selectedDropDownValue => _selectedBankDropDownValue;

  String get selectedCurrencyDropDownValue => _selectedCurrencyDropDownValue;

  TextEditingController get amountController => _amountController;

  TextEditingController get registerController => _registerController;

  TextEditingController get ibanController => _ibanController;

  TextEditingController get pnrController => _pnrController;

  String get bankCurrentCurrency {
    if (_selectedBankDropDownValue != null)
      return AppUtils.mapCurrencyIDToText(
          _selectedBankDropDownValue.currencyID);
    return 'TRY';
  }

  get bankList {
    if (_bankList != null) return _bankList;
    return List();
  }

  get banksDropdown => _banksDropDown;

  DepositBankTransferProvider(
      BaseMainRepository repo,
      List wallets,
      this._amountController,
      this._registerController,
      this._ibanController,
      this._pnrController)
      : super(repo, wallets) {
    availableBanksList();
  }

  set selectedDropDownValue(BankModel value) {
    _selectedBankDropDownValue = value;
    notifyListeners();
  }

  void availableBanksList() async {
    MainApiModel userBankList = await this.mainRepo.depositForm();
    if (userBankList.statusCode == 100) {
      List bankMaps = userBankList.data['banks'];
      _bankList = List();
      for (Map bank in bankMaps) _bankList.add(BankModel.fromMap(bank));
    }
    _banksDropDown = AppUtils.mapBankListToDropdownMenuItems(_bankList);
    selectedDropDownValue = _bankList[0];
  }
}
