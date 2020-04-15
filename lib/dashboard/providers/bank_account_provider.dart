import 'package:flutter/foundation.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

class BankAccountProvider with ChangeNotifier {
  BaseMainRepository _baseMainRepository;
  List _accountsList;
  BankAccountProvider(this._baseMainRepository) {
    _getUserBankAccounts();
  }

  List get accountsList => _accountsList != null ? _accountsList : List();

  deleteBankAccount(var bankID) async {
    await _baseMainRepository.bankAccountDelete(bankID);
    _getUserBankAccounts();
  }

  refreshUI() {
    _getUserBankAccounts();
  }

  _getUserBankAccounts() async {
    MainApiModel bankList = await _baseMainRepository.bankAccountsList();
    if (bankList.statusCode == 100) {
      _accountsList = bankList.data['accounts'];
    }
    notifyListeners();
  }
}
