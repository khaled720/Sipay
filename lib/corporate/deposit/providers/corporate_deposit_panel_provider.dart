import 'package:flutter/material.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/corporate/deposit/json_models/c_bank_list_model.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/transactions_screen_base_provider.dart';
import 'package:fluttersipay/corporate/utils/c_app_utils.dart';

class Corporate_DepositPanelProvider extends TransactionsScreenBaseProvider {
  List<CorporateBankModel> _bankList;
  List<DropdownMenuItem<CorporateBankModel>> _banksDropDown;
  CorporateBankModel _selectedBankDropDownValue;

  CorporateBankModel get selectedDropDownValue => _selectedBankDropDownValue;


  get bankList {
    if (_bankList != null) return _bankList;
    return List();
  }

  get banksDropdown => _banksDropDown;

  Corporate_DepositPanelProvider(
      BaseMainRepository repo,
      List wallets)
      : super(repo, wallets) {
    availableBanksList();
  }

  set selectedDropDownValue(CorporateBankModel value) {
    _selectedBankDropDownValue = value;
    notifyListeners();
  }


  void availableBanksList() async {
    MainApiModel userBankList = await this.mainRepo.depositForm();
    if (userBankList.statusCode == 100) {
      List bankMaps = userBankList.data['banks'];
      _bankList = List();
      for (Map bank in bankMaps) _bankList.add(CorporateBankModel.fromMap(bank));
    }
    _banksDropDown = C_AppUtils.mapBankListToDropdownMenuItems(_bankList);
    selectedDropDownValue = _bankList[0];
  }

}
