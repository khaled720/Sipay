import 'package:flutter/material.dart';

import '../../base_main_repo.dart';
import 'base_money_transfer_provider.dart';

class SendMoneyToCorporateProvider extends BaseMoneyTransferProvider {
  SendMoneyToCorporateProvider(
      BaseMainRepository repo,
      List wallets,
      TextEditingController receiverController,
      TextEditingController amountController,
      TextEditingController descriptionController)
      : super(repo, wallets, receiverController, amountController,
            descriptionController);
}
