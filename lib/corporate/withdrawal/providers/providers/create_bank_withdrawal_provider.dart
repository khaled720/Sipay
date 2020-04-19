import 'package:flutter/material.dart';
import 'package:fluttersipay/corporate/dashboard/merchant_repo.dart';
import 'package:fluttersipay/corporate/withdrawal/json_models/corporate_withdrawal_bank_model.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/transactions_screen_base_provider.dart';
import 'package:fluttersipay/utils/app_utils.dart';

import '../../../../base_main_repo.dart';

class CreateCorporateBankWithdrawProvider
    extends TransactionsScreenBaseProvider {
  MerchantMainRepository _merchantMainRepository;
  List<CorporateWithdrawalBankModel> _bankList;
  List<DropdownMenuItem<CorporateWithdrawalBankModel>> _banksDropDown;
  List<String> _currenciesDropDown = ['TRY', 'USD', 'EUR'];
  List<String> _currencyDropDown = ['TRY'];
  List _commissionsList;
  CorporateWithdrawalBankModel _selectedBankDropDownValue;
  String _selectedCurrencyDropDownValue = 'TRY';
  String _withdrawalErrorText;
  CorporateWithdrawalBankModel _currentSelectedBank;
  TextEditingController _amountController;
  TextEditingController _accountHolderController;
  TextEditingController _feeController;
  TextEditingController _swiftController;
  TextEditingController _netAccountController;
  bool _showSwiftCode;
  int _userType = 0;

  CorporateWithdrawalBankModel get selectedBankDropDownValue =>
      _selectedBankDropDownValue;

  String get selectedCurrencyDropDownValue => _selectedCurrencyDropDownValue;

  String get withdrawalErrorText => _withdrawalErrorText;

  List<String> get currencyDropDown => _currencyDropDown;

  List<String> get currenciesDropDown => _currenciesDropDown;

  bool get showSwiftCode => _showSwiftCode;

  TextEditingController get amountController => _amountController;

  TextEditingController get feeController => _feeController;

  TextEditingController get accountHolderController => _accountHolderController;

  TextEditingController get netAccountController => _netAccountController;

  TextEditingController get swiftController => _swiftController;

  get bankList {
    if (_bankList != null) return _bankList;
    return List();
  }

  get banksDropdown => _banksDropDown;

  CreateCorporateBankWithdrawProvider(
      BaseMainRepository repo,
      List wallets,
      this._amountController,
      this._accountHolderController,
      this._netAccountController,
      this._feeController,
      this._swiftController)
      : super(repo, wallets) {
    _merchantMainRepository = repo;
    availableBanksList();
    _amountController.addListener(_calculateNetAndTransactionFee);
  }

  set selectedDropDownValue(CorporateWithdrawalBankModel value) {
    _selectedBankDropDownValue = value;
    _currentSelectedBank = value;
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

  _setWithdrawalErrorText(String text) {
    _withdrawalErrorText = text;
    notifyListeners();
  }

  void availableBanksList() async {
    MainApiModel userBankList = await this.mainRepo.getWithdrawForm();
    if (userBankList.statusCode == 100) {
      List bankMaps = userBankList.data['saved_accounts'];
      _bankList = List();
      for (Map bank in bankMaps)
        _bankList.add(CorporateWithdrawalBankModel.fromMap(bank));
      _banksDropDown =
          AppUtils.mapCorporateWithdrawalBankListToDropdownMenuItems(_bankList);
      selectedDropDownValue = _bankList[0];
      _commissionsList = userBankList.data['commissions'];
      if (_commissionsList != null) {
        if (_commissionsList.isNotEmpty)
          _userType = _commissionsList[0]['user_type'] ?? 0;
      }
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

  void createWithdrawal(Function onSuccess, Function onFailure) async {
    double amount = double.parse(_amountController.text.trim());
    double decimal = (amount - amount.toInt()) * 100;
    int deci = decimal.round();
    await _merchantMainRepository.corporateWithdrawAdd(
        selectedBankDropDownValue.id,
        selectedBankDropDownValue.staticBankID,
        selectedBankDropDownValue.accountHolderName,
        AppUtils.mapCurrencyTextToID(_selectedCurrencyDropDownValue),
        selectedBankDropDownValue.bankName,
        amount.toInt().toString(),
        deci.toString(),
        null,
        _swiftController.text.trim() ?? '');
//    _setWithdrawalErrorText(null);
//    if (_amountController.text.trim().isNotEmpty &&
//        _netAccountController.text.trim().isNotEmpty &&
//        ''.isNotEmpty &&
//        _accountHolderController.text.trim().isNotEmpty) {
//      String swiftCode = _swiftController.text.trim();
//      if (_selectedCurrencyDropDownValue != 'TRY') {
//        if (_swiftController.text.trim().isEmpty) {
//          _setWithdrawalErrorText(
//              'One of the fields is empty. Please try again.');
//          return;
//        }
//      }
//      IndividualMainRepository repo = mainRepo;
//      setShowLoad(true);
//      MainApiModel bankWithdrawalModel;
////      MainApiModel bankWithdrawalModel = await repo.withdrawCreate(
////          swiftCode,
////          _currentSelectedBank.id,
////          _accountHolderController.text.trim(),
////          '',
////          _amountController.text.trim(),
////          AppUtils.mapCurrencyTextToID(_selectedCurrencyDropDownValue),
////          _currentSelectedBank.bankName,
////          _checkbox ? '1' : '0'_savedAccount ? '1' : '0',
////          _userType);
//      setShowLoad(false);
//      if (bankWithdrawalModel.statusCode == 100 ||
//          bankWithdrawalModel.statusCode == 4) {
//        onSuccess(null, bankWithdrawalModel, repo, UserTypes.Individual);
//      } else {
//        onFailure(bankWithdrawalModel.description);
//        _setWithdrawalErrorText(bankWithdrawalModel.description);
//      }
//    } else {
//      Future.delayed(Duration(seconds: 1));
//      _setWithdrawalErrorText('One of the fields is empty. Please try again.');
//    }
  }
}
