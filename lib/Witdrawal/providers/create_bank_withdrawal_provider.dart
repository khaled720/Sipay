import 'package:flutter/material.dart';
import 'package:fluttersipay/Witdrawal/json_models/withdrawal_bank_model.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/transactions_screen_base_provider.dart';
import 'package:fluttersipay/utils/app_utils.dart';

import '../../base_main_repo.dart';

class CreateBankWithdrawProvider extends TransactionsScreenBaseProvider {
  List<WithdrawalBankModel> _bankList;
  List<DropdownMenuItem<WithdrawalBankModel>> _banksDropDown;
  List<DropdownMenuItem<WithdrawalBankModel>> _savedAccountBanks;
  List<String> _currenciesDropDown = ['TRY', 'USD', 'EUR'];
  List<String> _currencyDropDown = ['TRY'];
  List _commissionsList;
  WithdrawalBankModel _selectedBankDropDownValue;
  String _selectedCurrencyDropDownValue = 'TRY';
  String _withdrawalErrorText;
  WithdrawalBankModel _savedAccountSelectedDropdownValue;
  TextEditingController _amountController;
  TextEditingController _accountHolderController;
  TextEditingController _ibanController;
  TextEditingController _feeController;
  TextEditingController _swiftController;
  TextEditingController _netAccountController;
  bool _showSwiftCode;
  bool _checkbox = false;

  WithdrawalBankModel get selectedBankDropDownValue =>
      _selectedBankDropDownValue;

  String get selectedCurrencyDropDownValue => _selectedCurrencyDropDownValue;

  String get depositErrorText => _withdrawalErrorText;

  WithdrawalBankModel get savedAccountSelectedDropdownValue =>
      _savedAccountSelectedDropdownValue;

  List<String> get currencyDropDown => _currencyDropDown;

  List<String> get currenciesDropDown => _currenciesDropDown;

  bool get showSwiftCode => _showSwiftCode;

  bool get checkbox => _checkbox;

  TextEditingController get amountController => _amountController;

  TextEditingController get feeController => _feeController;

  TextEditingController get accountHolderController => _accountHolderController;

  TextEditingController get ibanController => _ibanController;

  TextEditingController get netAccountController => _netAccountController;

  TextEditingController get swiftController => _swiftController;

  get bankList {
    if (_bankList != null) return _bankList;
    return List();
  }

  get banksDropdown => _banksDropDown;

  get savedBanksDropdown => _savedAccountBanks;

  CreateBankWithdrawProvider(
      BaseMainRepository repo,
      List wallets,
      this._amountController,
      this._accountHolderController,
      this._ibanController,
      this._netAccountController,
      this._feeController,
      this._swiftController)
      : super(repo, wallets) {
    availableBanksList();
    _amountController.addListener(_calculateNetAndTransactionFee);
  }

  set selectedDropDownValue(WithdrawalBankModel value) {
    _selectedBankDropDownValue = value;
    notifyListeners();
  }

  void setSavedBankAccountDropdownValue(WithdrawalBankModel value) {
    _savedAccountSelectedDropdownValue = value;
    notifyListeners();
  }

  void setCurrencyDropDownValue(String value) {
    _selectedCurrencyDropDownValue = value;
    _currencyDropDown = [value];
    value == 'USD' || value == 'EUR'
        ? _showSwiftCode = true
        : _showSwiftCode = false;
    notifyListeners();
  }

  void setCheckBox(bool check) {
    this._checkbox = check;
    notifyListeners();
  }

  _setWithdrawalErrorText(String text) {
    _withdrawalErrorText = text;
    notifyListeners();
  }

  void availableBanksList() async {
    MainApiModel userBankList = await this.mainRepo.getWithdrawForm();
    if (userBankList.statusCode == 100) {
      List bankMaps = userBankList.data['bankList'];
      _bankList = List();
      for (Map bank in bankMaps)
        _bankList.add(WithdrawalBankModel.fromMap(bank));
      _banksDropDown =
          AppUtils.mapWithdrawalBankListToDropdownMenuItems(_bankList);
      selectedDropDownValue = _bankList[0];
      List savedBanks = userBankList.data['userSavedBankList'];
      if (savedBanks.isEmpty) savedBanks = [WithdrawalBankModel.empty()];
      _savedAccountBanks =
          AppUtils.mapWithdrawalBankListToDropdownMenuItems(savedBanks);
      _savedAccountSelectedDropdownValue = savedBanks[0];
      _commissionsList = userBankList.data['commissions'];
      notifyListeners();
    }
  }

  _calculateNetAndTransactionFee() {
    if (_amountController != null) {
      if (_amountController.text.trim().isNotEmpty) {
        double amount = double.parse(_amountController.text);
        double fee = 0.0;
        if (amount != null) {
          if (_commissionsList != null) {
            switch (_selectedCurrencyDropDownValue) {
              case 'TRY':
                fee = AppUtils.calculateFee(amount, _commissionsList, 0);
                break;
              case 'USD':
                fee = AppUtils.calculateFee(amount, _commissionsList, 1);
                break;
              case 'EUR':
                fee = AppUtils.calculateFee(amount, _commissionsList, 2);
                break;
            }
          }
          _feeController.text = fee.toStringAsFixed(2);
          _netAccountController.text = (amount - fee).toStringAsFixed(2);
        }
      } else {
        _feeController.text = '0.00';
        _netAccountController.text = '0.00';
      }
    }
  }

//  void createWithdrawal(Function onSuccess) async {
//    _setWithdrawalErrorText(null);
//    if (_amountController.text.trim().isNotEmpty &&
//        _netAccountController.text.trim().isNotEmpty &&
//        ibanController.text.trim().isNotEmpty) {
//      print(
//          'values are ${_amountController.text}currency id${_selectedBankDropDownValue.currencyID}');
//      print(
//          'pnr ${_netAccountController.text} id ${_selectedBankDropDownValue.id} iban ${_ibanController.text}');
//      setShowLoad(true);
//      MainApiModel bankDepositModel = await mainRepo.depositCreate(
//          amountController.text.trim(),
//          _selectedBankDropDownValue.currencyID,
//          _netAccountController.text.trim(),
//          _selectedBankDropDownValue.id,
//          _ibanController.text.trim());
//      setShowLoad(false);
//      bankDepositModel.statusCode == 100 || bankDepositModel.statusCode == 4
//          ? onSuccess(bankDepositModel)
//          : _setWithdrawalErrorText(bankDepositModel.description);
//    } else
//      _setWithdrawalErrorText('One of the fields is empty. Please try again.');
//  }
}
