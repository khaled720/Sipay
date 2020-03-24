import 'package:flutter/foundation.dart';
import 'package:fluttersipay/base_main_repo.dart';

class TransactionsScreenBaseProvider with ChangeNotifier {
  BaseMainRepository mainRepo;
  List userWallets;
  bool showLoad;
  TransactionsScreenBaseProvider(this.mainRepo, this.userWallets);

  String getAvailableWalletAmount(int index) {
    if (this.userWallets != null) {
      if (this.userWallets.isNotEmpty && index <= this.userWallets.length - 1)
        return this.userWallets[index]['available_amount'].toString();
    }
    return '0.0';
  }

  setShowLoad(bool load) {
    showLoad = load;
    notifyListeners();
  }
}
