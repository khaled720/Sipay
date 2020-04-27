import 'package:fluttersipay/utils/app_utils.dart';

List transactionDetailsMap({var values, String type}) {
  bool _isMerchant = type == null;
  if (values == null) return List();
  var typeMap = values;
  if (!_isMerchant) typeMap = values[type];
  typeMap = values['transaction'];
  List result = List();
  var id = {
    'title': 'Transaction ID',
    'value': AppUtils.replaceNullItemsToEmptyValues('#${typeMap['id']}')
  };
  result.add(id);
  var orderID = {
    'title': 'Order ID',
    'value': typeMap['remote_order_id'] != null
        ? '#${typeMap['remote_order_id']}'
        : 'Not Found'
  };
  result.add(orderID);
  var paymentID = {
    'title': 'Payment ID',
    'value': typeMap['payment_id'] != null
        ? '#${typeMap['payment_id']}'
        : 'Not Found'
  };
  result.add(paymentID);
  var status = {
    'title': 'Status',
    'value': _isMerchant
        ? typeMap['statedata']['name']
        : AppUtils.replaceNullItemsToEmptyValues(typeMap['']) //TODO
  };
  result.add(status);
  var creditCardNumber = {
    'title': 'Credit Card No',
    'value': _isMerchant
        ? typeMap['credit_card_no']
        : AppUtils.replaceNullItemsToEmptyValues(typeMap['credit_card_no'])
  };
  result.add(creditCardNumber);
  var cardHolderName = {
    'title': 'Card Holder Bank',
    'value': _isMerchant
        ? typeMap['card_holder_bank']
        : AppUtils.replaceNullItemsToEmptyValues(typeMap['card_holder_bank'])
  };
  result.add(cardHolderName);
  var amount = {
    'title': 'Amount',
    'value': typeMap['net'] != null
        ? '${typeMap['net']}${typeMap['currency_symbol']}'
        : 'Not Found' //TODO
  };
  result.add(amount);
  var productPrice = {
    'title': 'Product Price',
    'value': typeMap['product_price'] != null
        ? '${typeMap['product_price']}${typeMap['currency_symbol']}'
        : 'Not Found'
  };
  result.add(productPrice);
  var merchantShare = {
    'title': 'Merchant Share',
    'value': typeMap[''] != null
        ? '${typeMap['']}${typeMap['currency_symbol']}'
        : 'Not Found' //TODO //TODO
  };
  result.add(merchantShare);
  var date = {
    'title': 'Date',
    'value': AppUtils.replaceNullItemsToEmptyValues(typeMap['created_at'])
  };
  result.add(date);
  return result;
}
