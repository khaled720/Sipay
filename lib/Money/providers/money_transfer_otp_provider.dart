import 'package:flutter/material.dart';
import 'package:quiver/async.dart';

class MoneyTransferOTPProvider with ChangeNotifier {
  TextEditingController _otp;
  CountdownTimer _timer;
  MoneyTransferOTPProvider();
}
