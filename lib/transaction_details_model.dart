import 'package:fluttersipay/utils/app_utils.dart';

List transactionDetailsMap(var values, String type) {
  if (values == null) return List();
  var typeMap = values[type];
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
        : 'Not Found' //TODO
  };
  result.add(orderID);
  var paymentID = {
    'title': 'Payment ID',
    'value': typeMap['payment_id'] != null
        ? '#${typeMap['payment_id']}'
        : 'Not Found' //TODO
  };
  result.add(paymentID);
  var status = {
    'title': 'Status',
    'value': AppUtils.replaceNullItemsToEmptyValues(typeMap['']) //TODO
  };
  result.add(status);
  var creditCardNumber = {
    'title': 'IBAN',
    'value': AppUtils.replaceNullItemsToEmptyValues(typeMap['iban'])
  };
  result.add(creditCardNumber);
  var cardHolderName = {
    'title': 'Bank Name',
    'value': AppUtils.replaceNullItemsToEmptyValues(typeMap['bank_name'])
  };
  result.add(cardHolderName);
  var amount = {
    'title': 'Amount',
    'value': typeMap['net'] != null ? '${typeMap['net']}' : 'Not Found' //TODO
  };
  result.add(amount);
  var productPrice = {
    'title': 'Product Price',
    'value': typeMap[''] != null
        ? '${typeMap['']}${typeMap['currency_symbol']}'
        : 'Not Found' //TODO
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
