import 'package:fluttersipay/base_provider.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';
import 'package:fluttersipay/main_api_data_model.dart';

class IndividualPanelProvider extends BaseMainProvider {
  IndividualMainRepository _individualMainRepository;
  MainApiModel _userDataModel;
  Map<String, dynamic> _userInfo;
  List _userWallets;
  List _userLastTransactionsActivity;

  IndividualPanelProvider(this._individualMainRepository, this._userDataModel)
      : super(_individualMainRepository) {
    _userInfo = _userDataModel.data['user'];
    getDashboardDataFromApi();
  }

  dynamic getUserInfoValue(String key) =>
      _userInfo != null ? _userInfo[key] : '';

  get userName => getUserInfoValue('name');

  get phoneNumber => getUserInfoValue('phone');

  get userProfileImage => getUserInfoValue('avatar');

  get individualMainRepository => _individualMainRepository;

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
    MainApiModel userWalletModel =
        await _individualMainRepository.getUserWallet();
    if (userWalletModel.statusCode == 100) {
      _userWallets = userWalletModel.data['wallet'];
      notifyListeners();
    }
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

  Future<void> getDashboardDataFromApi() async {
    await _getUserWallets();
    await _getUserActivityList();
  }

  void _getUserActivityList() async {
    MainApiModel userLastTransactionActivity = await _individualMainRepository
        .individualTransactionsListActivity2('', '');
    if (userLastTransactionActivity.statusCode == 100)
      _userLastTransactionsActivity =
          userLastTransactionActivity.data['transactions']['data'];
    notifyListeners();
  }

  logoutUser(Function onSuccess, Function onFailure) async {
    MainApiModel logoutUser =
        await _individualMainRepository.logoutIndividual();
    logoutUser.statusCode == 100 ? onSuccess() : onFailure();
  }
}
