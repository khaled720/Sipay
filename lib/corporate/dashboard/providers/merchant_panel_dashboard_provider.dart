import 'package:fluttersipay/base_provider.dart';

import '../../../main_api_data_model.dart';
import '../merchant_repo.dart';

class MerchantPanelProvider extends BaseMainProvider {
  MerchantMainRepository _merchantMainRepository;
  MainApiModel _merchantDataModel;
  Map<String, dynamic> _userInfo;
  List _userWallets;
  List _userLastTransactionsActivity;

  MerchantPanelProvider(this._merchantMainRepository, this._merchantDataModel)
      : super(_merchantMainRepository) {
    _userInfo = _merchantDataModel.data['user'];
  }

  dynamic getUserInfoValue(String key) =>
      _userInfo != null ? _userInfo[key] : '';

  get userName => getUserInfoValue('name');

  get phoneNumber => getUserInfoValue('phone');

  get userProfileImage => getUserInfoValue('avatar');

  get corporateMainRepository => _merchantMainRepository;

  get userLastTransactionsActivity => _userLastTransactionsActivity;

  get userWallets => _userWallets;

  List getTransactionsListActivity() {
    if (userLastTransactionsActivity != null) {
      return _userLastTransactionsActivity;
    }
    return List();
  }

  //User wallet

  void _getUserWallets() async {
    String userWalletModel = await _merchantMainRepository.getUserWallet();
//    if (userWalletModel.statusCode == 100) {
//      _userWallets = userWalletModel.data['wallet'];
//      notifyListeners();
//    }
  }

  String getTotalWalletAmount(int index) {
    if (_userWallets != null) {
      if (_userWallets.isNotEmpty && index <= _userWallets.length - 1)
        return _userWallets[index]['total_amount'].toString();
    }
    return '0.0';
  }

  String getAvailableWalletAmount(int index) {
    if (_userWallets != null) {
      if (_userWallets.isNotEmpty && index <= _userWallets.length - 1)
        return _userWallets[index]['available_amount'].toString();
    }
    return '0.0';
  }

  String getWalletCurrencyCode(int index) {
    if (_userWallets != null) {
      if (_userWallets.isNotEmpty && index <= _userWallets.length - 1)
        return _userWallets[index]['currency_code'].toString();
    }
    return 'TRY';
  }

  void getDashboardDataFromApi() async {
    _getUserWallets();
    //_getUserActivityList();
  }

  void _getUserActivityList() async {
//    MainApiModel userLastTransactionActivity = await _corporateMainRepository
//        .individualTransactionsListActivity('', '');
//    if (userLastTransactionActivity.statusCode == 100)
//      _userLastTransactionsActivity =
//      userLastTransactionActivity.data['transactions']['data'];
    notifyListeners();
  }

  logoutMerchant(Function onSuccess, Function onFailure) async {
    MainApiModel logoutUser = await _merchantMainRepository.logoutCorporate();
    logoutUser.statusCode == 100 ? onSuccess() : onFailure();
  }
}
