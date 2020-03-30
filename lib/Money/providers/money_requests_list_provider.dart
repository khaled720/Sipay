import 'package:flutter/material.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

class MoneyRequestListProvider extends ChangeNotifier {
  var moneyTransferForm;
  var _moneyTransferRequestsList;
  var _moneyTransferSendList;
  IndividualMainRepository _userRepo;
  bool _incomingState = true;

  bool get incomingState => _incomingState;

  MoneyRequestListProvider(this._userRepo) {
    getMoneyRequestsList();
  }

  get moneyTransferRequestsList =>
      _moneyTransferRequestsList != null ? _moneyTransferRequestsList : List();

  get userRepo => _userRepo;

  get moneyTransferSendList =>
      _moneyTransferSendList != null ? _moneyTransferSendList : List();

  getMoneyRequestsList() async {
    MainApiModel moneyTransferRequestsList =
        await this._userRepo.moneyTransferListRequestMoney('', '', '', '');
    if (moneyTransferRequestsList.statusCode == 100) {
      _moneyTransferRequestsList =
          moneyTransferRequestsList.data['requestmoneydata']['data'];
    }
    MainApiModel moneyTransferListSendMoneyModel =
        await this._userRepo.moneyTransferListSendMoney('', '', '', '');
    if (moneyTransferListSendMoneyModel.statusCode == 100) {
      _moneyTransferSendList =
          moneyTransferListSendMoneyModel.data['sendmoneydata']['data'];
    }
    notifyListeners();
  }

  void setIncomingState() {
    _incomingState = !_incomingState;
    notifyListeners();
  }
}
