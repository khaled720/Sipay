import 'package:flutter/foundation.dart';
import 'package:fluttersipay/base_main_repo.dart';

abstract class BaseDetailsProvider with ChangeNotifier {
  final BaseMainRepository baseMainRepository;
  final String id;
  final String transactionType;
  var userTransactionDetailsList;
  bool _transactionNotFound;

  BaseDetailsProvider(this.baseMainRepository, this.id, this.transactionType) {
    _transactionNotFound = false;
    getDashboardDataFromApi();
  }

  List userTransactionsDetailsList() {
    if (userTransactionDetailsList != null) {
      return userTransactionDetailsList;
    }
    return List();
  }

  void getDashboardDataFromApi() async {
    getUserTransactionDetailsList();
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

  getUserTransactionDetailsList();
}
