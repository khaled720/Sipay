import 'package:flutter/material.dart';
import 'package:fluttersipay/deposit/json_models/bank_list_model.dart';
import 'package:fluttersipay/deposit/json_models/deposit_success_model.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/transactions_screen_base_provider.dart';
import 'package:fluttersipay/utils/app_utils.dart';
import 'package:fluttersipay/utils/constants.dart';

import '../../base_main_repo.dart';

class DepositBankTransferProvider extends TransactionsScreenBaseProvider {
  List<BankModel> _bankList;
  List<DropdownMenuItem<BankModel>> _banksDropDown;
  BankModel _selectedBankDropDownValue;
  String _selectedCurrencyDropDownValue;
  String _depositErrorText;
  TextEditingController _amountController;
  TextEditingController _receiverController;
  TextEditingController _ibanController;
  TextEditingController _pnrController;

  BankModel get selectedDropDownValue => _selectedBankDropDownValue;

  String get selectedCurrencyDropDownValue => _selectedCurrencyDropDownValue;

  String get depositErrorText => _depositErrorText;

  TextEditingController get amountController => _amountController;

  TextEditingController get receiverController => _receiverController;

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
      this._receiverController,
      this._ibanController,
      this._pnrController)
      : super(repo, wallets) {
    availableBanksList();
  }

  set selectedDropDownValue(BankModel value) {
    _selectedBankDropDownValue = value;
    notifyListeners();
  }

  _setDepositErrorText(String text) {
    _depositErrorText = text;
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

  void createDeposit(Function onSuccess) async {
    _setDepositErrorText(null);
    if (_amountController.text.trim().isNotEmpty &&
        _pnrController.text.trim().isNotEmpty &&
        ibanController.text.trim().isNotEmpty) {
      print(
          'values are ${_amountController.text}currency id${_selectedBankDropDownValue.currencyID}');
      print(
          'pnr ${_pnrController.text} id ${_selectedBankDropDownValue.id} iban ${_ibanController.text}');
      setShowLoad(true);
      MainApiModel bankDepositModel = await mainRepo.depositCreate(
          amountController.text.trim(),
          _selectedBankDropDownValue.currencyID,
          _pnrController.text.trim(),
          _selectedBankDropDownValue.id,
          _ibanController.text.trim());
      setShowLoad(false);
      if (bankDepositModel.statusCode == 100 ||
          bankDepositModel.statusCode == 4) {
        var depositInputs = bankDepositModel.data['inputs'];
        String status = 'Success';
        String message = 'Your deposit request was successfully created';
        if (bankDepositModel.statusCode == 4) {
          status = 'Pending';
          message = 'Your deposit request is now pending for review';
        }
        DepositSuccessModel depositSuccessModel = DepositSuccessModel(
            status,
            message,
            _selectedBankDropDownValue.bankName,
            siPayBankName,
            depositInputs['iban_no'],
            depositInputs['pnr_code'],
            depositInputs['amount'],
            AppUtils.mapCurrencyIDToText(
                int.parse(depositInputs['currency_id'])));
        onSuccess(depositSuccessModel);
      } else
        _setDepositErrorText(bankDepositModel.description);
    } else
      _setDepositErrorText('One of the fields is empty. Please try again.');
  }
}
