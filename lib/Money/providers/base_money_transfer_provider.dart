import 'package:flutter/material.dart';
import 'package:fluttersipay/Witdrawal/json_models/withdrawal_bank_model.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/transactions_screen_base_provider.dart';

import '../../base_main_repo.dart';

class BaseMoneyTransferProvider extends TransactionsScreenBaseProvider {
  List<WithdrawalBankModel> _bankList;
  List<DropdownMenuItem<WithdrawalBankModel>> _banksDropDown;
  List<DropdownMenuItem<WithdrawalBankModel>> _savedAccountBanks;
  var moneyTransferForm;
  WithdrawalBankModel _selectedBankDropDownValue;
  String _selectedCurrencyDropDownValue = 'TRY';
  String _withdrawalErrorText;
  IndividualMainRepository _userRepo;
  WithdrawalBankModel _savedAccountSelectedDropdownValue;
  TextEditingController _receiverController;
  TextEditingController _amountController;
  TextEditingController _descriptionController;

  WithdrawalBankModel get selectedBankDropDownValue =>
      _selectedBankDropDownValue;

  String get selectedCurrencyDropDownValue => _selectedCurrencyDropDownValue;

  String get depositErrorText => _withdrawalErrorText;

  WithdrawalBankModel get savedAccountSelectedDropdownValue =>
      _savedAccountSelectedDropdownValue;

  TextEditingController get receiverController => _receiverController;

  TextEditingController get amountController => _amountController;

  TextEditingController get descriptionController => _descriptionController;

  get bankList {
    if (_bankList != null) return _bankList;
    return List();
  }

  get banksDropdown => _banksDropDown;

  get savedBanksDropdown => _savedAccountBanks;

  BaseMoneyTransferProvider(
    BaseMainRepository repo,
    List wallets,
    this._receiverController,
    this._amountController,
    this._descriptionController,
  ) : super(repo, wallets) {
    _userRepo = repo;
    getMoneyTransferForm();
  }

  set selectedDropDownValue(WithdrawalBankModel value) {
    _selectedBankDropDownValue = value;
    notifyListeners();
  }

  void setSavedBankAccountDropdownValue(WithdrawalBankModel value) {
    _savedAccountSelectedDropdownValue = value;
    notifyListeners();
  }

  _setWithdrawalErrorText(String text) {
    _withdrawalErrorText = text;
    notifyListeners();
  }

  getMoneyTransferForm() async {
    MainApiModel moneyTransferFormModel =
        await this._userRepo.moneyTransferForm();
    if (moneyTransferFormModel.statusCode == 100) {
      moneyTransferForm = moneyTransferFormModel.data;
      notifyListeners();
    }
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
