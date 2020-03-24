import 'package:flutter/material.dart';
import 'package:fluttersipay/Witdrawal/json_models/withdrawal_bank_model.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

class MoneyRequestListProvider extends ChangeNotifier {
  List<WithdrawalBankModel> _bankList;
  var moneyTransferForm;
  var _moneyTransferRequestsList;
  var _moneyTransferSendList;
  String _selectedCurrencyDropDownValue = 'TRY';
  String _withdrawalErrorText;
  IndividualMainRepository _userRepo;

  String get selectedCurrencyDropDownValue => _selectedCurrencyDropDownValue;

  String get depositErrorText => _withdrawalErrorText;

  MoneyRequestListProvider(this._userRepo) {
    getMoneyRequestsList();
  }

  get moneyTransferRequestsList =>
      _moneyTransferRequestsList != null ? _moneyTransferRequestsList : List();

  get moneyTransferSendList =>
      _moneyTransferSendList != null ? _moneyTransferSendList : List();

  getMoneyRequestsList() async {
    MainApiModel moneyTransferRequestsList =
        await this._userRepo.moneyTransferListRequestMoney('', '', '', '');
    if (moneyTransferRequestsList.statusCode == 100) {
      _moneyTransferRequestsList =
          moneyTransferRequestsList.data['requestmoneydata'];
    }
    MainApiModel moneyTransferListSendMoneyModel =
        await this._userRepo.moneyTransferListSendMoney('', '', '', '');
    if (moneyTransferListSendMoneyModel.statusCode == 100) {
      _moneyTransferSendList =
          moneyTransferListSendMoneyModel.data['sendmoneydata']['data'];
      // _moneyTransferSendList=
    }
    notifyListeners();
  }

//  void createWithdrawal(Function onSuccess) async {
//    _setWithdrawalErrorText(null);
//    if (_amountController.text.trim().isNotEmpty &&
//        _netAccountController.text.trim().isNotEmpty &&
//        ibanController.text.trim().isNotEmpty) {
//      print(
//          'values are ${_amountController.text}currency id${_selectedBankDropDownValue.currencyID}');
//      print(
//          'pnr ${_netAccountController.text} id ${_selectedBankDropDownValue.id} iban ${_ibanController.text}');
//      setShowLoad(true);
//      MainApiModel bankDepositModel = await mainRepo.depositCreate(
//          amountController.text.trim(),
//          _selectedBankDropDownValue.currencyID,
//          _netAccountController.text.trim(),
//          _selectedBankDropDownValue.id,
//          _ibanController.text.trim());
//      setShowLoad(false);
//      bankDepositModel.statusCode == 100 || bankDepositModel.statusCode == 4
//          ? onSuccess(bankDepositModel)
//          : _setWithdrawalErrorText(bankDepositModel.description);
//    } else
//      _setWithdrawalErrorText('One of the fields is empty. Please try again.');
//  }
}
