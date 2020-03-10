import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum NavigationToSMSTypes { Login, Register }

final maskFormatter = new MaskTextInputFormatter(mask: '+################');

final loadingDots = SpinKitChasingDots(color: Colors.blue);

final otpGradient =
    LinearGradient(colors: [Color(0xff88d3ce), Color(0xff6e45e2)]);

final defaultLoader = SpinKitChasingDots(color: Colors.blue);
