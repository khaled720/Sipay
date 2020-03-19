import 'package:fluttersipay/transactions_screen_base_provider.dart';

import '../../../base_main_repo.dart';

class MoneyPanelProvider extends TransactionsScreenBaseProvider {
  MoneyPanelProvider(BaseMainRepository repo, List wallets)
      : super(repo, wallets);
}
