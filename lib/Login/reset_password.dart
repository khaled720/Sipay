import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_main.dart';

TextEditingController _epassController = TextEditingController();

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ResetPass(),
    );
  }
}

class ResetPass extends StatefulWidget {
  ResetPass({Key key}) : super(key: key);
  @override
  _MyresetPassword createState() => _MyresetPassword();
}

class _MyresetPassword extends State<ResetPass> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ŞİFRE SIFIRLAMA"),
        flexibleSpace: Image(
          image: AssetImage('assets/appbar_bg.png'),
          height: 100,
          fit: BoxFit.fitHeight,
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: 20.0),
            icon: Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                child: Padding(
              padding: EdgeInsets.only(top: 30.0, left: 30.0),
              child: Text(
                'ŞİFRENİZİ Mİ UNUTTUNUZ?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Text(
                  'Şifrenizi sıfırlamak için hesabınıza bağlı olan e-posta adresin',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(130),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black38),
                  controller: _epassController,
                  decoration: InputDecoration(
                    hintText: 'E-posta adresiniz',
                    hintStyle: CustomTextStyle.formField(context),
                    enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black38, width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black38, width: 1.0)),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.black38,
                    ),
                  ),

                  obscureText: false,
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(80),
            ),
            Container(
              width: ScreenUtil.getInstance().setWidth(690),
              child: Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: FlatButton(
                  disabledColor: Colors.blue,
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'SIFIRLAMA BAĞLANTISI GÖNDER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
