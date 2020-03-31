import 'package:flutter/material.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/corporate/deposit/json_models/c_bank_list_model.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/transactions_screen_base_provider.dart';
import 'package:fluttersipay/corporate/utils/c_app_utils.dart';
import 'package:fluttersipay/corporate/deposit/json_models/c_deposit_success.dart';



class Corporate_CreateDepositProvider extends TransactionsScreenBaseProvider {
  List<CorporateBankModel> _bankList;
  List<DropdownMenuItem<CorporateBankModel>> _banksDropDown;
  CorporateBankModel _selectedBankDropDownValue;

  String _selectedCurrencyDropDownValue = 'TRY';

  String _depositErrorText;

  TextEditingController _amountController;
  TextEditingController _receiverController;
  TextEditingController _ibanController;
  TextEditingController _pnrController;

  CorporateBankModel get selectedDropDownValue => _selectedBankDropDownValue;


  String get selectedCurrencyDropDownValue => _selectedCurrencyDropDownValue;

  String get depositErrorText => _depositErrorText;

  TextEditingController get amountController => _amountController;

  TextEditingController get receiverController => _receiverController;

  TextEditingController get ibanController => _ibanController;

  TextEditingController get pnrController => _pnrController;


  set selectedCurrencyDropdownValue(String currency) {
    _selectedCurrencyDropDownValue = currency;
    notifyListeners();
  }

  get bankList {
    if (_bankList != null) return _bankList;
    return List();
  }

  get banksDropdown => _banksDropDown;

  Corporate_CreateDepositProvider(
      BaseMainRepository repo,
      List wallets,
      this._amountController,
      this._receiverController,
      this._ibanController,
      this._pnrController,
      this._banksDropDown,
      this._selectedBankDropDownValue)
      : super(repo, wallets);

  _setDepositErrorText(String text) {
    _depositErrorText = text;
    notifyListeners();
  }

  set selectedDropDownValue(CorporateBankModel value) {
    _selectedBankDropDownValue = value;
    notifyListeners();
  }



  void createDeposit(Function onSuccess) async {
    _setDepositErrorText(null);
    if (_amountController.text.trim().isNotEmpty &&
        _pnrController.text.trim().isNotEmpty &&
        ibanController.text.trim().isNotEmpty) {
      print(
          'values are ${_amountController.text}currency id${_selectedCurrencyDropDownValue}');
      print(
          'pnr ${_pnrController.text} id ${_selectedBankDropDownValue.id} iban ${_ibanController.text}');
      setShowLoad(true);
      MainApiModel bankDepositModel = await mainRepo.depositCreate(
          amountController.text.trim(),
          C_AppUtils.mapCurrencyTextToID(_selectedCurrencyDropDownValue),
          _pnrController.text.trim(),
          _selectedBankDropDownValue.id,
          _ibanController.text.trim());
      setShowLoad(false);
      if (bankDepositModel.statusCode == 100 ||
          bankDepositModel.statusCode == 4) {
        var depositInputs = bankDepositModel.data['inputs'];
        String status = 'Success';
        String message = 'Your deposit request was successfully created';
        if (bankDepositModel.statusCode == 4) {
          status = 'Pending';
          message = 'Your deposit request is now pending for review';
        }
        C_DepositSuccessModel depositSuccessModel = C_DepositSuccessModel(
            status,
            message,
            depositInputs['iban_no'],
            depositInputs['amount'],);
            onSuccess(depositSuccessModel);
      } else
        _setDepositErrorText(bankDepositModel.description);
    } else
      _setDepositErrorText('One of the fields is empty. Please try again.');
  }
}
