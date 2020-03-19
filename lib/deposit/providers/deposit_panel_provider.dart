import 'package:fluttersipay/transactions_screen_base_provider.dart';

import '../../base_main_repo.dart';

class DepositPanelProvider extends TransactionsScreenBaseProvider {
  DepositPanelProvider(BaseMainRepository repo, List wallets)
      : super(repo, wallets);
}
