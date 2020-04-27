import 'package:fluttersipay/base_details_provider.dart';
import 'package:fluttersipay/base_main_repo.dart';
import 'package:fluttersipay/corporate/dashboard/merchant_repo.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';
import 'package:fluttersipay/utils/constants.dart';

import '../../transaction_details_model.dart';

class TransactionsDetailsProvider extends BaseDetailsProvider {
  final UserTypes _userType;
  TransactionsDetailsProvider(BaseMainRepository baseMainRepository,
      String transactionType, String id, this._userType)
      : super(baseMainRepository, transactionType, id);

  @override
  getUserTransactionDetailsList() async {
    setTransactionNotFound(false);
    if (_userType == UserTypes.Individual) {
      IndividualMainRepository individualMainRepository = baseMainRepository;
      MainApiModel userLastTransactionActivity =
          await individualMainRepository.individualTransactionsDetailsActivity(
              transactionId, transactionType.toLowerCase());
      if (userLastTransactionActivity.statusCode == 100) {
        Map transactionDetails = userLastTransactionActivity.data;
        userTransactionDetailsList = transactionDetailsMap(
            values: transactionDetails, type: transactionType.toLowerCase());
      } else
        setTransactionNotFound(true);
      notifyListeners();
    } else {
      MerchantMainRepository merchantMainRepository = baseMainRepository;
      MainApiModel userLastTransactionActivity = await merchantMainRepository
          .corporateTransactionDetails(transactionId);
      if (userLastTransactionActivity.statusCode == 100) {
        Map transactionDetails = userLastTransactionActivity.data;
        userTransactionDetailsList =
            transactionDetailsMap(values: transactionDetails);
      } else
        setTransactionNotFound(true);
      notifyListeners();
    }
  }
}
