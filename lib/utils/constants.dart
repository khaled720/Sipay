import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum NavigationToSMSTypes { Login, Register }
enum UserTypes { Individual, Corporate }
enum TransactionData { Title, ID, Value, Date, Type }
enum SecuritySettingsTypes { Password, Email }

final maskFormatter = new MaskTextInputFormatter(mask: '+################');

final ibanMaskFormatter = MaskTextInputFormatter(
    mask: '#### #### #### #### #### #### #### ####',
    filter: {"#": RegExp(r'^[a-zA-Z0-9_.-]*$')});

final siPayBankName = 'Sipay Elektronik Money and Payment Services Inc.';

final loadingDots = SpinKitChasingDots(color: Colors.blue);

final otpGradient =
    LinearGradient(colors: [Color(0xff88d3ce), Color(0xff6e45e2)]);

final rememberMeCheckboxKey = 'remember_me_key';

final defaultLoader = SpinKitChasingDots(color: Colors.blue);
