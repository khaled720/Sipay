import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/app_utils.dart';
import 'package:fluttersipay/utils/constants.dart';

class TransactionsHistoryProvider with ChangeNotifier {
  IndividualMainRepository _individualMainRepository;
  List _userTransactionsList;
  var startDate;
  var endDate;
  String _selectedCurrency;
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

  TransactionsHistoryProvider(this._individualMainRepository) {
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
    switch (_initalTransactionsList) {
      case true:
        switch (data) {
          case TransactionData.Title:
            return AppUtils.getTransactionableType(
                _userTransactionsList[index]['transactionable_type']);
            break;
          case TransactionData.ID:
            return 'Transaction ID: #${_userTransactionsList[index]['transactionable_id']}';
            break;
          case TransactionData.Value:
            return '${_userTransactionsList[index]['money_flow']} ${_userTransactionsList[index]['net'].toString()} ${AppUtils.mapCurrencyIDToCurrencySign(_userTransactionsList[index]['currency_id'])}';
            break;
          case TransactionData.Date:
            return _userTransactionsList[index]['created_at'];
            break;
          case TransactionData.Type:
            return '${AppUtils.mapMoneyFlowToColorType(_userTransactionsList[index]['money_flow'])}';
            break;
        }
        break;
      case false:
        switch (data) {
          case TransactionData.Title:
            return _searchType;
            break;
          case TransactionData.ID:
            return 'Transaction ID: #${_userTransactionsList[index]['id']}';
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
    MainApiModel userLastTransactionActivity = await _individualMainRepository
        .individualTransactionsListActivity('\'', '');
    if (userLastTransactionActivity.statusCode == 100)
      _userTransactionsList =
          userLastTransactionActivity.data['transactions']['data'];
    notifyListeners();
  }

  void searchUserTransactionList() async {
    String dateRange;
    if (startDate == null || endDate == null)
      dateRange = '';
    else
      dateRange = AppUtils.getDateRangeBetweenTwoDates(startDate, endDate);
    _load(true);
    print(
        'state $selectedTransactionState, type $selectedTransactionType, currency $_selectedCurrency, daterage $dateRange');
    MainApiModel userLastTransactionActivity =
        await _individualMainRepository.searchIndividualTransactionsList(
            searchKey ?? '',
            selectedTransactionState == 'STATES' ||
                    selectedTransactionState == null
                ? ''
                : AppUtils.mapTransactionStateToIndex(selectedTransactionState)
                    .toString(),
            _selectedCurrency == 'CURRENCY' || _selectedCurrency == null
                ? ''
                : _selectedCurrency.toLowerCase(),
            selectedTransactionType == 'TYPES' ||
                    selectedTransactionType == null
                ? ''
                : selectedTransactionType.toLowerCase(),
            dateRange);
    _load(false);
    if (userLastTransactionActivity.statusCode == 100) {
      _userTransactionsList =
          userLastTransactionActivity.data['transactions']['data'];
      _searchType = selectedTransactionType;
      _initalTransactionsList = false;
    }

    print('$_userTransactionsList');
  }
}
