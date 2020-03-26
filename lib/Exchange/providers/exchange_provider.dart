import 'package:flutter/material.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/app_utils.dart';

import '../../base_main_repo.dart';
import '../../transactions_screen_base_provider.dart';

class ExchangeProvider extends TransactionsScreenBaseProvider {
  List<String> _currenciesDropDown = ['TRY', 'USD', 'EUR'];
  List<String> _currencyDropDown = ['TRY'];
  String _selectedCurrencyDropDownValue1 = 'TRY';
  String _selectedCurrencyDropDownValue2 = 'USD';
  String _withdrawalErrorText;
  String _userPhone;
  var _exchangeRate;
  TextEditingController _fromController;
  TextEditingController _toController;

  IndividualMainRepository _individualMainRepository;

  ExchangeProvider(BaseMainRepository repo, List wallets, this._fromController,
      this._toController)
      : super(repo, wallets) {
    _individualMainRepository = repo;
    getExchangeForm();
    _fromController.addListener(_amountListener);
  }

  String get selectedCurrencyDropDownValue1 => _selectedCurrencyDropDownValue1;

  String get selectedCurrencyDropDownValue2 => _selectedCurrencyDropDownValue2;

  String get depositErrorText => _withdrawalErrorText;

  List<String> get currencyDropDown => _currencyDropDown;

  List<String> get currenciesDropDown => _currenciesDropDown;

  TextEditingController get toController => _toController;

  String get userPhone => _userPhone != null ? _userPhone : '';

  TextEditingController get fromController => _fromController;

  _amountListener() {
    if (_exchangeRate != null) {
      if (_fromController.text.trim().isNotEmpty) {
        double fromAmount = double.parse(_fromController.text.trim());
        double toAmount = fromAmount - (fromAmount * _exchangeRate);
        _toController.text = toAmount.toStringAsFixed(2);
      } else {
        _toController.text = '0.0';
      }
    }
  }

  set selectedCurrencyDropDownValue1(String value) {
    if (value != _selectedCurrencyDropDownValue2) {
      _selectedCurrencyDropDownValue1 = value;
      _calculateRate();
    }
    notifyListeners();
  }

  set selectedCurrencyDropDownValue2(String value) {
    if (value != _selectedCurrencyDropDownValue1) {
      _selectedCurrencyDropDownValue2 = value;
      _calculateRate();
    }
    notifyListeners();
  }

  _calculateRate() async {
    int currency1 =
        AppUtils.mapCurrencyTextToID(_selectedCurrencyDropDownValue1);
    int currency2 =
        AppUtils.mapCurrencyTextToID(_selectedCurrencyDropDownValue2);
    MainApiModel rateModel = await _individualMainRepository.exchangeForm(
        currency1, currency2, false);
    if (rateModel.statusCode == 100) {
      _exchangeRate =
          rateModel.data['exchange']['exchanges_to_second_currency_value'] ?? 0;
      print('exchangeRate is $_exchangeRate');
      _amountListener();
    }
    notifyListeners();
  }

  void getExchangeForm() async {
    MainApiModel exchangeFormModel =
        await _individualMainRepository.exchangeForm(1, 1, true);
    if (exchangeFormModel.statusCode == 100) {
      _userPhone = exchangeFormModel.data['user']['phone'];
      _exchangeRate = exchangeFormModel.data['exchange']
          ['exchanges_to_second_currency_value'];
      notifyListeners();
    }
  }

  void createExchange(Function onSuccess, Function onFailure) async {
    if (_fromController.text.trim().isNotEmpty &&
        _toController.text.trim().isNotEmpty &&
        _exchangeRate != 0) {
      int currency1 =
          AppUtils.mapCurrencyTextToID(_selectedCurrencyDropDownValue1);
      int currency2 =
          AppUtils.mapCurrencyTextToID(_selectedCurrencyDropDownValue2);
      double amount = double.parse(_fromController.text.trim());
      double decimal = (amount - amount.toInt()) * 100;
      int deci = decimal.round();
      setShowLoad(true);
      MainApiModel exchangeCreateModel =
          await _individualMainRepository.createExchange(
              1,
              currency1,
              currency2,
              amount.toString(),
              deci.toString(),
              _exchangeRate.toString());
      setShowLoad(false);
      if (exchangeCreateModel != null) {
        exchangeCreateModel.statusCode == 100
            ? onSuccess()
            : onFailure(exchangeCreateModel.description);
      }
    }
  }
}
