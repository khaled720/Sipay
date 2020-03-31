import 'package:fluttersipay/base_details_provider.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

import '../../transaction_details_model.dart';

class TransactionsDetailsProvider extends BaseDetailsProvider {
  TransactionsDetailsProvider(IndividualMainRepository individualMainRepository,
      String transactionType, String id)
      : super(individualMainRepository, transactionType, id);

  @override
  getUserTransactionDetailsList() async {
    setTransactionNotFound(false);
    MainApiModel userLastTransactionActivity =
        await individualMainRepository.individualTransactionsDetailsActivity(
            transactionId, transactionType.toLowerCase());
    if (userLastTransactionActivity.statusCode == 100) {
      Map transactionDetails = userLastTransactionActivity.data;
      userTransactionDetailsList = transactionDetailsMap(
          transactionDetails, transactionType.toLowerCase());
    } else
      setTransactionNotFound(true);
    notifyListeners();
  }
}
