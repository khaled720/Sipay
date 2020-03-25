import 'package:flutter/material.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

import '../../base_main_repo.dart';
import '../../transactions_screen_base_provider.dart';

class ExchangeProvider extends TransactionsScreenBaseProvider {
  List<String> _currenciesDropDown = ['TRY', 'USD', 'EUR'];
  List<String> _currencyDropDown = ['TRY'];
  List _commissionsList;
  String _selectedCurrencyDropDownValue1 = 'TRY';
  String _selectedCurrencyDropDownValue2 = 'TRY';
  String _withdrawalErrorText;
  TextEditingController _fromController;
  TextEditingController _toController;

  IndividualMainRepository _individualMainRepository;
  ExchangeProvider(BaseMainRepository repo, List wallets, this._fromController,
      this._toController)
      : super(repo, wallets) {
    _individualMainRepository = repo;
    getExchangeForm();
  }

  String get selectedCurrencyDropDownValue1 => _selectedCurrencyDropDownValue1;

  String get selectedCurrencyDropDownValue2 => _selectedCurrencyDropDownValue2;

  String get depositErrorText => _withdrawalErrorText;

  List<String> get currencyDropDown => _currencyDropDown;

  List<String> get currenciesDropDown => _currenciesDropDown;

  TextEditingController get toController => _toController;

  TextEditingController get fromController => _fromController;

  set selectedCurrencyDropDownValue1(String value) {
    _selectedCurrencyDropDownValue1 = value;
    notifyListeners();
  }

  set selectedCurrencyDropDownValue2(String value) {
    _selectedCurrencyDropDownValue2 = value;
    notifyListeners();
  }

  _setExchangeErrorText(String text) {
    _withdrawalErrorText = text;
    notifyListeners();
  }

  void getExchangeForm() async {
    MainApiModel exchangeFormModel =
        await _individualMainRepository.exchangeForm(1, 1);
    if (exchangeFormModel.statusCode == 100) {}
  }
}
