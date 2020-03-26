import 'package:flutter/material.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/app_utils.dart';
import 'package:fluttersipay/utils/constants.dart';

import '../../base_main_repo.dart';
import 'base_money_transfer_provider.dart';

class SendMoneyToIndividualProvider extends BaseMoneyTransferProvider {
  String _selectedReceiverDropdownValue = "MERCHANT";

  SendMoneyToIndividualProvider(
      BaseMainRepository repo,
      List wallets,
      TextEditingController receiverController,
      TextEditingController amountController,
      TextEditingController descriptionController)
      : super(repo, wallets, receiverController, amountController,
            descriptionController);

  String get selectedReceiverDropdownValue => _selectedReceiverDropdownValue;

  set selectedReceiverDropdownValue(String value) {
    _selectedReceiverDropdownValue = value;
    notifyListeners();
  }

  void moneyTransfer(Function onSendToOTP, Function onFailure) async {
    if (receiverController.text.trim().isNotEmpty &&
        amountController.text.trim().isNotEmpty) {
      double amount = double.parse(amountController.text.trim());
      if (amount > 0.0) {
        switch (_selectedReceiverDropdownValue) {
          case 'MERCHANT':
            MainApiModel sendToMerchantModel =
                await userRepo.createMoneySendToMerchantValidate(
                    0,
                    receiverController.text.trim(),
                    amountController.text.trim(),
                    AppUtils.mapCurrencyTextToID(selectedReceiverDropdownValue),
                    descriptionController.text.trim() ?? '');
            if (sendToMerchantModel != null)
              sendToMerchantModel.statusCode == 100
                  ? onSendToOTP(sendToMerchantModel, UserTypes.Corporate)
                  : onFailure(sendToMerchantModel.description);
            break;
          case 'INDIVIDUAL':
            MainApiModel sendToUserModel =
                await userRepo.createMoneySendToUserValidate(
                    receiverController.text.trim(),
                    amountController.text.trim(),
                    AppUtils.mapCurrencyTextToID(selectedReceiverDropdownValue),
                    descriptionController.text.trim() ?? '');
            if (sendToUserModel != null)
              sendToUserModel.statusCode == 100
                  ? onSendToOTP(sendToUserModel, UserTypes.Individual)
                  : onFailure(sendToUserModel.description);
            break;
        }
      }
    }
  }
}
