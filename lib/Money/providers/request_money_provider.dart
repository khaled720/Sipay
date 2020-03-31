import 'package:flutter/cupertino.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/utils/app_utils.dart';

import '../../base_main_repo.dart';
import '../../main_api_data_model.dart';
import '../../transactions_screen_base_provider.dart';

class MoneyRequestProvider extends TransactionsScreenBaseProvider {
  TextEditingController _amountController;
  TextEditingController _phoneController;
  TextEditingController _descriptionController;
  var _selectedCurrency = "TRY";
  List<String> _currencyList = ["TRY", "USD", "EUR"];
  bool _phoneLoading = false;
  String _receiverName;

  TextEditingController get amountController => _amountController;

  TextEditingController get phoneController => _phoneController;

  TextEditingController get descriptionController => _descriptionController;

  get selectedCurrency => _selectedCurrency;

  get phoneLoading => _phoneLoading;

  String get receiverData => _receiverName;

  List<String> get currencyList => _currencyList;

  MoneyRequestProvider(
      BaseMainRepository repo,
      List wallets,
      this._amountController,
      this._phoneController,
      this._descriptionController)
      : super(repo, wallets);

  set currencyDropDown(String value) {
    _selectedCurrency = value;
    notifyListeners();
  }

  set receiverData(String value) {
    _receiverName = value;
    notifyListeners();
  }

  set phoneLoading(bool load) {
    _phoneLoading = load;
    notifyListeners();
  }

  onReceiverPhoneSubmitted(value) async {
    if (value != null) {
      if (value.toString().trim().isNotEmpty) {
        phoneLoading = true;
        receiverData = null;
        IndividualMainRepository userRepo = mainRepo;
        MainApiModel moneyReceiverInfo = await userRepo
            .moneyTransferReceiverInfo(null, _phoneController.text.trim());
        phoneLoading = false;
        if (moneyReceiverInfo.statusCode == 100)
          receiverData = moneyReceiverInfo.data['receiver_info']['name'];
        else
          receiverData = 'Non SiPay User';
      }
    }
  }

  void createMoneyRequest(Function onSuccess, Function onFailure) async {
    if (_phoneController.text.trim().isNotEmpty &&
        amountController.text.trim().isNotEmpty) {
      double amount = double.parse(amountController.text.trim());
      if (amount > 0.0) {
        if (receiverData != null) {
          if (receiverData != 'Non SiPay User') {
            setShowLoad(true);
            IndividualMainRepository userRepo = mainRepo;
            MainApiModel sendToUserModel = await userRepo.createMoneyRequest(
                _amountController.text.trim(),
                _phoneController.text.trim(),
                AppUtils.mapCurrencyTextToID(_selectedCurrency),
                descriptionController.text.trim() ?? '');
            setShowLoad(false);
            if (sendToUserModel != null)
              sendToUserModel.statusCode == 100
                  ? onSuccess()
                  : onFailure(sendToUserModel.description);
          }
        } else
          onReceiverPhoneSubmitted(_phoneController.text.trim());
      }
    }
  }
}
