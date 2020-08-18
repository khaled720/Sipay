import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttersipay/corporate/dashboard/merchant_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/app_utils.dart';
import 'package:fluttersipay/utils/constants.dart';

import '../../base_main_repo.dart';

class TransactionsHistoryProvider with ChangeNotifier {
  BaseMainRepository _baseRepo;
  List _userTransactionsList;
  var startDate;
  var endDate;
  String _selectedCurrency;
  UserTypes _userType;
  String searchKey;
  String selectedTransactionType;
  String _searchType;
  String selectedTransactionState;
  bool _showLoad;
  bool _initalTransactionsList;

  List userTransactionsList() {
    if (_userTransactionsList != null) {
      return _userTransactionsList;
    }
    return List();
  }

  TransactionsHistoryProvider(this._baseRepo, this._userType) {
    _initalTransactionsList = true;
    _selectedCurrency = 'CURRENCY';
    getDashboardDataFromApi();
  }

  void getDashboardDataFromApi() async {
    _getUserActivityList();
  }

  get selectedCurrency => _selectedCurrency;

  set selectedCurrency(String currency) {
    _selectedCurrency = currency;
    notifyListeners();
  }

  set transactionType(String value) {
    selectedTransactionType = value;
  }

  dynamic getDataFromTransactionsList(TransactionData data, int index) {
  double net,k=2.4;
if(data == TransactionData.Value){
  net=double.parse(_userTransactionsList[index]['net'].toString());
print(k.toStringAsFixed(2).toString());

}
    switch (_initalTransactionsList) {
      case true:
        switch (data) {
          case TransactionData.Title:
            return _userType == UserTypes.Individual
                ? AppUtils.getTransactionableType(
                    _userTransactionsList[index]['transactionable_type'])
                : 'Payment by ' +
                    AppUtils.mapMerchantPaymentTypeToText(
                        _userTransactionsList[index]['payment_type_id']);
            break;
          case TransactionData.ID:
            return 'Transaction ID: #${_userType == UserTypes.Individual ? _userTransactionsList[index]['transactionable_id'] : _userTransactionsList[index]['id']}';
            break;
          case TransactionData.Value:
            return _userType == UserTypes.Individual
                ? '${_userTransactionsList[index]['money_flow']} ${_userTransactionsList[index]['net'].toString()} ${AppUtils.mapCurrencyIDToCurrencySign(_userTransactionsList[index]['currency_id'])}'
                : '${net.toStringAsFixed(2)} sss ${AppUtils.mapCurrencyIDToCurrencySign(_userTransactionsList[index]['currency_id'])}';
            break;
          case TransactionData.Date:
            return _userTransactionsList[index]['created_at'];
            break;
          case TransactionData.Type:
            return _userType == UserTypes.Individual
                ? '${AppUtils.mapMoneyFlowToColorType(_userTransactionsList[index]['money_flow'])}'
                : '';
            break;
        }
        break;
      case false:
        switch (data) {
          case TransactionData.Title:
            return _userType == UserTypes.Individual
                ? _searchType
                : 'Payment by ' +
                    AppUtils.mapMerchantPaymentTypeToText(
                        _userTransactionsList[index]['payment_type_id']);
            break;
          case TransactionData.ID:
            return '${_userTransactionsList[index]['id']}';
            break;
          case TransactionData.Value:
            return '${_userTransactionsList[index]['net'].toString()} ${AppUtils.mapCurrencyIDToCurrencySign(_userTransactionsList[index]['currency_id'])}';
            break;
          case TransactionData.Date:
            return _userTransactionsList[index]['created_at'];
            break;
          case TransactionData.Type:
            AppUtils.mapMoneyFlowToColorType(null);
            break;
        }
    }
  }

  get showLoad => _showLoad;

  _load(bool load) {
    this._showLoad = load;
    notifyListeners();
  }

  void setSelectedTransactionType(String type) {
    selectedTransactionType = type;
    notifyListeners();
  }

  void _getUserActivityList() async {
    MainApiModel userLastTransactionActivity;
    switch (_userType) {
      case UserTypes.Individual:
        userLastTransactionActivity =
            await _baseRepo.individualTransactionsListActivity('\'', '');
        if (userLastTransactionActivity.statusCode == 100)
          _userTransactionsList =
              userLastTransactionActivity.data['transactions']['data'];
        break;
      case UserTypes.Corporate:
        MerchantMainRepository merchantMainRepository = _baseRepo;
        userLastTransactionActivity =
            await merchantMainRepository.corporateTransactionsList(
          '',
          '',
        );
        if (userLastTransactionActivity.statusCode == 100)
          _userTransactionsList =
              userLastTransactionActivity.data['transactions'];
        break;
    }
    notifyListeners();
  }

  void searchUserTransactionList() async {
    String dateRange;
    if (startDate == null || endDate == null)
      dateRange = '';
    else
      dateRange = AppUtils.getDateRangeBetweenTwoDates(startDate, endDate);
    MainApiModel userLastTransactionActivity;
    _load(true);
    if (_userType == UserTypes.Individual) {
      userLastTransactionActivity =
          await _baseRepo.searchIndividualTransactionsList(
              searchKey ?? '',
              selectedTransactionState == 'STATES' ||
                      selectedTransactionState == null
                  ? ''
                  : AppUtils.mapTransactionStateToIndex(
                          selectedTransactionState)
                      .toString(),
              _selectedCurrency == 'CURRENCY' || _selectedCurrency == null
                  ? ''
                  : _selectedCurrency.toLowerCase(),
              selectedTransactionType == 'TYPES' ||
                      selectedTransactionType == null
                  ? ''
                  : selectedTransactionType.toLowerCase(),
              dateRange);
    } else {
      MerchantMainRepository merchantMainRepository = _baseRepo;
      userLastTransactionActivity =
          await merchantMainRepository.corporateTransactionsList(
              _selectedCurrency == 'CURRENCY' || _selectedCurrency == null
                  ? ''
                  : AppUtils.mapCurrencyTextToID(_selectedCurrency).toString(),
              dateRange);
    }

    _load(false);
    if (userLastTransactionActivity.statusCode == 100) {
      _userTransactionsList = _userType == UserTypes.Individual
          ? _userTransactionsList =
              userLastTransactionActivity.data['transactions']['data']
          : _userTransactionsList =
              userLastTransactionActivity.data['transactions'];
      _searchType = selectedTransactionType;
      _initalTransactionsList = false;
    }
  }
}
