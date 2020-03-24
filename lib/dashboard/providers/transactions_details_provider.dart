import 'package:flutter/foundation.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

import '../../transaction_details_model.dart';

class TransactionsDetailsProvider with ChangeNotifier {
  final IndividualMainRepository _individualMainRepository;
  final String id;
  final String _transactionType;
  var _userTransactionDetailsList;
  bool _transactionNotFound;

  List userTransactionsDetailsList() {
    if (_userTransactionDetailsList != null) {
      return _userTransactionDetailsList;
    }
    return List();
  }

  TransactionsDetailsProvider(
      this._individualMainRepository, this.id, this._transactionType) {
    getDashboardDataFromApi();
  }

  void getDashboardDataFromApi() async {
    _getUserTransactionDetailsList();
  }

  get transactionNotFound => _transactionNotFound;

  void setTransactionNotFound(bool notFound) {
    _transactionNotFound = notFound;
    notifyListeners();
  }

  int get transactionId {
    List idList = id.split('#');
    try {
      return int.parse(idList[1]);
    } catch (e) {
      return -1;
    }
  }

  void _getUserTransactionDetailsList() async {
    setTransactionNotFound(false);
    MainApiModel userLastTransactionActivity =
        await _individualMainRepository.individualTransactionsDetailsActivity(
            transactionId, _transactionType.toLowerCase());
    if (userLastTransactionActivity.statusCode == 100) {
      Map transactionDetails = userLastTransactionActivity.data;
      _userTransactionDetailsList = transactionDetailsMap(
          transactionDetails, _transactionType.toLowerCase());
    } else
      setTransactionNotFound(true);
    notifyListeners();
  }
}
