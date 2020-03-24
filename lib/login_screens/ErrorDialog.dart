import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorDialog extends StatelessWidget {
  final VoidCallback callback;

  ErrorDialog(this.callback);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1304, allowFontScaling: true)
          ..init(context);
    return new Dialog(
        child: new Container(
      width: ScreenUtil.getInstance().setWidth(690),
      height: ScreenUtil.getInstance().setHeight(560),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Icon(
            Icons.cancel,
            color: Colors.red,
            size: 50,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'LOGIN FAILED',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 37.0, right: 37.0),
              child: Text(
                'The information you entered is incomplete or incorrect. Please check and try again.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: FlatButton(
                onPressed: callback,
                color: Colors.blue,
                disabledColor: Colors.blue,
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            width: ScreenUtil.getInstance().setWidth(690),
          )
        ],
      ),
    ));
  }
}
