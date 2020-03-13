import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final bool isVisible;
  LoadingWidget({this.isVisible});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SpinKitChasingDots(
        color: Colors.blue,
      ),
    );
  }
}
