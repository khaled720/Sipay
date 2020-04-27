import 'package:fluttersipay/dashboard/repos/individual_repo.dart';

import '../../base_details_provider.dart';
import '../../main_api_data_model.dart';
import '../../transaction_details_model.dart';

class MoneyTransferRequestDetailsProvider extends BaseDetailsProvider {
  IndividualMainRepository individualMainRepository;
  MoneyTransferRequestDetailsProvider(
      this.individualMainRepository, String id, String transactionType)
      : super(individualMainRepository, id, transactionType);

  @override
  getUserTransactionDetailsList() async {
    setTransactionNotFound(false);
    MainApiModel userLastMoneyRequestActivity = await individualMainRepository
        .moneyTransferDetails(id, transactionType.toLowerCase());
    if (userLastMoneyRequestActivity.statusCode == 100) {
      Map transactionDetails = userLastMoneyRequestActivity.data;
      userTransactionDetailsList = transactionDetailsMap(
          values: transactionDetails, type: transactionType.toLowerCase());
    } else
      setTransactionNotFound(true);
    notifyListeners();
  }
}
