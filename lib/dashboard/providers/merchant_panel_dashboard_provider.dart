import 'package:fluttersipay/dashboard/providers/base_provider.dart';
import 'package:fluttersipay/dashboard/repos/merchant_repo.dart';

class MerchantPanelProvider extends BaseMainProvider {
  MerchantMainRepository merchantMainRepository;
  MerchantPanelProvider(this.merchantMainRepository)
      : super(merchantMainRepository);
}
