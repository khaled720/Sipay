import 'package:fluttersipay/dashboard/providers/base_provider.dart';
import 'package:fluttersipay/dashboard/repos/individual_repo.dart';

class IndividualPanelProvider extends BaseMainProvider {
  IndividualMainRepository individualMainRepository;
  IndividualPanelProvider(this.individualMainRepository)
      : super(individualMainRepository);
}
