import 'package:flutter/material.dart';
import 'package:fluttersipay/corporate/dashboard/merchant_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/app_utils.dart';
import 'package:fluttersipay/utils/constants.dart';

import '../../base_main_repo.dart';
import 'base_money_transfer_provider.dart';

class SendMoneyToCorporateProvider extends BaseMoneyTransferProvider {
  String _receiverName;
  var _receiverPhone;
  bool _phoneLoading;
  final _userType;

  SendMoneyToCorporateProvider(
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
        MainApiModel moneyReceiverInfo;
        if (this._userType == UserTypes.Corporate) {
          MerchantMainRepository merchantRepo = mainRepo;
          moneyReceiverInfo =
              await merchantRepo.getB2BMerchantReceiverInfo(value);
          if (moneyReceiverInfo.statusCode == 100) {
            receiverData = moneyReceiverInfo.data['receiver_merchant']['name'];
            _receiverPhone = moneyReceiverInfo.data['receiver_merchant']['id'];
          } else
            receiverData = 'Non SiPay User';
        } else {
          moneyReceiverInfo =
              await mainRepo.moneyTransferReceiverInfo(value, null);
          if (moneyReceiverInfo.statusCode == 100) {
            receiverData = moneyReceiverInfo.data['receiver_info']['name'];
            _receiverPhone = moneyReceiverInfo.data['receiver_info']['phone'];
          } else
            receiverData = 'Non SiPay User';
        }
        phoneLoading = false;
      }
    }
  }

  void moneyTransfer(Function onSendToOTP, Function onFailure) async {
    if (receiverController.text.trim().isNotEmpty &&
        amountController.text.trim().isNotEmpty) {
      double amount = double.parse(amountController.text.trim());
      if (amount > 0.0) {
        if (receiverData != null && moneyTransferForm != null) {
          if (receiverData != 'Non SiPay User') {
            if (_receiverPhone != null) {
              showLoad = true;
              MainApiModel sendToMerchantModel;
              if (_userType == UserTypes.Corporate) {
                MerchantMainRepository merchantRepo = mainRepo;
                sendToMerchantModel = await merchantRepo.corporateB2BPayment(
                    moneyTransferForm['user_merchant']['id'],
                    moneyTransferForm['user_merchant']['name'],
                    _receiverPhone,
                    receiverData,
                    amountController.text.trim(),
                    AppUtils.mapCurrencyTextToID(selectedCurrencyDropDownValue),
                    descriptionController.text.trim() ?? '');
                if (sendToMerchantModel != null) {
                  sendToMerchantModel.statusCode == 100
                      ? onSendToOTP(
                          sendToMerchantModel.data['user']['phone'],
                          sendToMerchantModel,
                          mainRepo,
                          UserTypes.Corporate,
                          true)
                      : onFailure(sendToMerchantModel.description);
                }
              } else {
                sendToMerchantModel =
                    await mainRepo.createMoneySendToMerchantValidate(
                        receiverData,
                        _receiverPhone,
                        amountController.text.trim(),
                        AppUtils.mapCurrencyTextToID(
                            selectedCurrencyDropDownValue),
                        descriptionController.text.trim() ?? '');
                if (sendToMerchantModel != null) {
                  print("######## "+sendToMerchantModel.statusCode.toString());
                  sendToMerchantModel.statusCode == 100
                      ? onSendToOTP(
                          sendToMerchantModel.data['inputs']['sender_phone'],
                          sendToMerchantModel,
                          mainRepo,
                          UserTypes.Corporate,
                          false)
                      : onFailure(sendToMerchantModel.description+"*/---");
                }
              }
              showLoad = false;
            }
          }
        } else
          onReceiverPhoneSubmitted(receiverController.text.trim());
      }
    }
  }
}
