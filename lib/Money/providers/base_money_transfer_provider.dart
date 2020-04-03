import 'package:flutter/material.dart';
import 'package:fluttersipay/Witdrawal/json_models/withdrawal_bank_model.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/transactions_screen_base_provider.dart';

import '../../base_main_repo.dart';

class BaseMoneyTransferProvider extends TransactionsScreenBaseProvider {
  List<WithdrawalBankModel> _bankList;
  List<DropdownMenuItem<WithdrawalBankModel>> _banksDropDown;
  List<DropdownMenuItem<WithdrawalBankModel>> _savedAccountBanks;
  var moneyTransferForm;
  WithdrawalBankModel _selectedBankDropDownValue;
  String _selectedCurrencyDropDownValue = 'TRY';
  String _withdrawalErrorText;
  WithdrawalBankModel _savedAccountSelectedDropdownValue;
  TextEditingController _receiverController;
  TextEditingController _amountController;
  TextEditingController _descriptionController;
  bool _showLoad;

  WithdrawalBankModel get selectedBankDropDownValue =>
      _selectedBankDropDownValue;

  String get selectedCurrencyDropDownValue => _selectedCurrencyDropDownValue;

  String get depositErrorText => _withdrawalErrorText;

  WithdrawalBankModel get savedAccountSelectedDropdownValue =>
      _savedAccountSelectedDropdownValue;

  TextEditingController get receiverController => _receiverController;

  bool get showLoad => _showLoad;

  TextEditingController get amountController => _amountController;

  TextEditingController get descriptionController => _descriptionController;

  get bankList {
    if (_bankList != null) return _bankList;
    return List();
  }

  get banksDropdown => _banksDropDown;

  get savedBanksDropdown => _savedAccountBanks;

  BaseMoneyTransferProvider(
    BaseMainRepository repo,
    List wallets,
    this._receiverController,
    this._amountController,
    this._descriptionController,
  ) : super(repo, wallets) {
    getMoneyTransferForm();
  }

  set selectedDropDownValue(WithdrawalBankModel value) {
    _selectedBankDropDownValue = value;
    notifyListeners();
  }

  set showLoad(bool load) {
    _showLoad = load;
    notifyListeners();
  }

  void setSavedBankAccountDropdownValue(WithdrawalBankModel value) {
    _savedAccountSelectedDropdownValue = value;
    notifyListeners();
  }

  set selectedCurrencyDropdownValue(String currency) {
    _selectedCurrencyDropDownValue = currency;
    notifyListeners();
  }

  getMoneyTransferForm() async {
    MainApiModel moneyTransferFormModel =
        await this.mainRepo.moneyTransferForm();
    if (moneyTransferFormModel.statusCode == 100) {
      moneyTransferForm = moneyTransferFormModel.data;
      notifyListeners();
    }
  }
}
