import 'package:fluttersipay/transactions_screen_base_provider.dart';

import '../../base_main_repo.dart';

class WithdrawalProvider extends TransactionsScreenBaseProvider {
  WithdrawalProvider(BaseMainRepository repo, List wallets)
      : super(repo, wallets);
}
