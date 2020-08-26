import 'package:flutter/material.dart';
import 'package:fluttersipay/corporate/dashboard/merchant_repo.dart';
import 'package:fluttersipay/corporate/withdrawal/json_models/corporate_withdrawal_bank_model.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/transactions_screen_base_provider.dart';
import 'package:fluttersipay/utils/app_utils.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:translator/translator.dart' as translator;
      
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
  var _currentMerchantData;
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
      _currentMerchantData = userBankList.data['user_merchant'];
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
    _setWithdrawalErrorText(null);
    if (_amountController.text.trim().isNotEmpty &&
        _currentMerchantData != null) {
      if (_selectedCurrencyDropDownValue != 'TRY') {
        if (_swiftController.text.trim().isEmpty) {
          _setWithdrawalErrorText(
              'One of the fields is empty. Please try again.');
          return;
        }
      }
      setShowLoad(true);
      MainApiModel merchantWithdrawalModel =
          await _merchantMainRepository.corporateWithdrawAdd(
              selectedBankDropDownValue.staticBankID,
              selectedBankDropDownValue.accountHolderName,
              AppUtils.mapCurrencyTextToID(_selectedCurrencyDropDownValue),
              selectedBankDropDownValue.bankName,
              _amountController.text.trim(),
              selectedBankDropDownValue.iban,
              _swiftController.text.trim() ?? '',
              _currentMerchantData['id'],
              _currentMerchantData['name'],
              _currentMerchantData['user_type']);
      setShowLoad(false);
      if (merchantWithdrawalModel != null) {
        
        if (merchantWithdrawalModel.statusCode == 100) {
          onSuccess(merchantWithdrawalModel.data['user']['phone'],
              merchantWithdrawalModel, mainRepo, UserTypes.Corporate);
        } else{
          
    var translation = await translator.GoogleTranslator().translate(merchantWithdrawalModel.description, to: 'en');
   
          
          
          _setWithdrawalErrorText(translation.toString().contains("var1")?translation.toString().replaceFirst("var1", "10 TL"):translation);
           } 
           
               }
    } else {
      Future.delayed(Duration(seconds: 1));
      _setWithdrawalErrorText('One of the fields is empty. Please try again.');
    }
  }
}
