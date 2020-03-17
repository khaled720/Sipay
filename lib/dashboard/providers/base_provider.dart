import 'package:flutter/foundation.dart';
import 'package:fluttersipay/dashboard/repos/base_main_repo.dart';

class BaseMainProvider with ChangeNotifier {
  BaseMainRepository baseMainRepository;
  bool showLoad;
  BaseMainProvider(this.baseMainRepository);

  void setShowLoading(bool load) {
    showLoad = load;
    notifyListeners();
  }
}
