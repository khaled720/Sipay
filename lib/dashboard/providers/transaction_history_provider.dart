import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/app_utils.dart';

class TransactionsHistoryProvider with ChangeNotifier {
  IndividualMainRepository _individualMainRepository;
  List _userTransactionsList;
  var startDate;
  var endDate;
  String selectedCurrency;
  String searchKey;
  String selectedTransactionType;
  String selectedTransactionState;
  bool _showLoad;

  List userTransactionsList() {
    if (_userTransactionsList != null) {
      return _userTransactionsList;
    }
    return List();
  }

  TransactionsHistoryProvider(this._individualMainRepository) {
    getDashboardDataFromApi();
  }

  void getDashboardDataFromApi() async {
    _getUserActivityList();
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
        'state $selectedTransactionState, type $selectedTransactionType, currency $selectedCurrency, daterage $dateRange');
    MainApiModel userLastTransactionActivity =
        await _individualMainRepository.individualTransactionsList(
            searchKey ?? '',
            selectedTransactionState == 'STATES' ||
                    selectedTransactionState == null
                ? ''
                : AppUtils.mapTransactionStateToIndex(selectedTransactionState)
                    .toString(),
            selectedCurrency == 'CURRENCY' || selectedCurrency == null
                ? ''
                : selectedTransactionType.toLowerCase(),
            selectedTransactionType == 'TYPES' ||
                    selectedTransactionType == null
                ? ''
                : selectedTransactionType.toLowerCase(),
            dateRange);
    _load(false);
    if (userLastTransactionActivity.statusCode == 100)
      _userTransactionsList =
          userLastTransactionActivity.data['transactions']['data'];
    print('$_userTransactionsList');
  }
}
