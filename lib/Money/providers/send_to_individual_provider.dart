import 'package:flutter/material.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/app_utils.dart';
import 'package:fluttersipay/utils/constants.dart';

import '../../base_main_repo.dart';
import 'base_money_transfer_provider.dart';

class SendMoneyToIndividualProvider extends BaseMoneyTransferProvider {
  String _receiverName;
  bool _phoneLoading;
  final UserTypes _userType;

  SendMoneyToIndividualProvider(
      BaseMainRepository repo,
      List wallets,
      TextEditingController receiverController,
      TextEditingController amountController,
      TextEditingController descriptionController,
      this._userType)
      : super(repo, wallets, receiverController, amountController,
            descriptionController, _userType) {
    _phoneLoading = false;
  }

  String get receiverData => _receiverName;

  bool get phoneLoading => _phoneLoading;

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
        MainApiModel moneyReceiverInfo =
            await mainRepo.moneyTransferReceiverInfo(null, value);
        phoneLoading = false;
        if (moneyReceiverInfo.statusCode == 100)
          receiverData = moneyReceiverInfo.data['receiver_info']['name'];
        else
          receiverData = 'Non SiPay User';
      }
    }
  }

  void moneyTransfer(Function onSendToOTP, Function onFailure) async {
    if (receiverController.text.trim().isNotEmpty &&
        amountController.text.trim().isNotEmpty) {
      double amount = double.parse(amountController.text.trim());
      if (amount > 0.0) {
        if (receiverData != null) {
          if (receiverData != 'Non SiPay User') {
            showLoad = true;
            MainApiModel sendToUserModel =
                await mainRepo.createMoneySendToUserValidate(
                    receiverController.text.trim(),
                    amountController.text.trim(),
                    AppUtils.mapCurrencyTextToID(selectedCurrencyDropDownValue),
                    descriptionController.text.trim() ?? '');
            showLoad = false;
            if (sendToUserModel != null)
              sendToUserModel.statusCode == 100
                  ? onSendToOTP(sendToUserModel.data['inputs']['sender_phone'],
                      sendToUserModel, mainRepo, UserTypes.Individual)
                  : onFailure(sendToUserModel.description);
          }
        } else
          onReceiverPhoneSubmitted(receiverController.text.trim());
      }
    }
  }
}
