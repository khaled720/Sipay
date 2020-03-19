import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Login/login_slide.dart';
import 'package:fluttersipay/Login/reset_password.dart';

import 'ErrorDialog.dart';

TextEditingController _phoneController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

class Login_main extends StatelessWidget {
  // This widget is the root of your app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyLoginPage(),
      routes: <String, WidgetBuilder>{
//        '/register': (BuildContext context) => Register(),
//        '/smsuserverification': (BuildContext context) => SMSUSERVERIFICAION(),
//        '/verify': (BuildContext context) => SMS_userverify(),
//        '/userverification': (BuildContext context) => USERVERIFICATION(),
//        '/registration': (BuildContext context) => USEREGISTRICATION(),
//        '/deposit_panel': (BuildContext context) => Depost_Panel(),
////        '/merchant' : (BuildContext context) => Merchant_panel(),
//        '/sendmoney': (BuildContext context) => Send_Money(),
//        '/password_verify': (BuildContext context) => Password_verify(),
//        '/smsverification': (BuildContext context) => SMSVERIFICAION(),
//        '/c_smsverification': (BuildContext context) => C_SMSVERIFICAION(),
      },
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key}) : super(key: key);
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  void initState() {
    super.initState();
  }

  bool _customer = true;
  bool _remember = false;
  bool _checkemail = true;
  bool _checkphone = true;
  _NumberTextInputFormatter _phoneNumberFormatter =
      _NumberTextInputFormatter(90);

  void _updatecustomer() {
    setState(() {
      _customer = !_customer;
    });
  }

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
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/home_logo.png',
                      width: ScreenUtil.getInstance().setWidth(300),
                      height: ScreenUtil.getInstance().setHeight(190)),
                ],
              )),
            ),
            width: ScreenUtil.getInstance().setWidth(750),
            height: ScreenUtil.getInstance().setHeight(190),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(60),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          decoration: new BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                //                   <--- left side
                                color: _customer ? Colors.blue : Colors.black26,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: SizedBox(
                                width: ScreenUtil.getInstance().setWidth(345),
                                child: OutlineButton(
                                  onPressed: _updatecustomer,
                                  borderSide: new BorderSide(
                                    style: BorderStyle.none,
                                  ),
                                  child: new Text(
                                    'INDIVIDUAL',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: _customer
                                            ? Colors.blue
                                            : Colors.black26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          )),
                    ),
                    Expanded(
                      child: Container(
                          decoration: new BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                //                   <--- left side
                                color: _customer ? Colors.black26 : Colors.blue,
                                width: 2.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: ScreenUtil.getInstance().setWidth(345),
                              child: OutlineButton(
                                onPressed: _updatecustomer,
                                borderSide: new BorderSide(
                                  style: BorderStyle.none,
                                ),
                                child: new Text(
                                  'CORPORATE',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: _customer
                                          ? Colors.black26
                                          : Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            width: ScreenUtil.getInstance().setWidth(750),
            height: ScreenUtil.getInstance().setHeight(80),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(10),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    child:
                        _customer ? _showconsumer(context) : _showcorporate(),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(20),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Checkbox(
                                value: _remember,
                                onChanged: (bool value) {
                                  setState(() {
                                    _remember = value;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text("Remember Me"),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResetPassword()),
                                );
                              },
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(690),
                    child: FlatButton(
                      onPressed: () {
                        _showDialog(_customer);
                      },
                      color: Colors.blue,
                      disabledColor: Colors.blue,
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(10),
                  ),
                  Container(
                    child: _customer ? _noaccount() : null,
                  ),
                ],
              ),
            ),
            width: ScreenUtil.getInstance().setWidth(750),
            height: ScreenUtil.getInstance().setHeight(610),
          ),
          Container(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                '%10 OFF SHOPPING IN JUNE!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            width: ScreenUtil.getInstance().setWidth(750),
            height: ScreenUtil.getInstance().setHeight(80),
          ),
          Container(
            child: LoginPage(),
            width: ScreenUtil.getInstance().setWidth(750),
            height: ScreenUtil.getInstance().setHeight(270),
          )
        ],
      ),
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _noaccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(child: Text('Dont have an account?')),
        Container(
          child: FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: Text(
              'Register Here',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _showconsumer(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(30),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: _checkphone
                ? Container(
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    height: 0,
                  )
                : Row(
                    children: <Widget>[
                      Text(
                        'User not found Click here ',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'register',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              onChanged: (text) {
                if (text.length > 0 && !_checkphone) {
                  setState(() {
                    _checkphone = true;
                  });
                }
              },
              style: TextStyle(color: _checkphone ? Colors.black : Colors.red),
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: CustomTextStyle.formField(context),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: _checkphone ? Colors.black38 : Colors.red,
                        width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: _checkphone ? Colors.black38 : Colors.red,
                        width: 1.0)),
                prefixIcon: _checkphone
                    ? const Icon(
                        Icons.phone,
                        color: Colors.black38,
                      )
                    : const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
              ),
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                // Fit the validating format.
//                _phoneNumberFormatter,
              ],
              obscureText: false,
            ),
          ),
        ),
      ],
    );
  }

  Widget _showcorporate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(30),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: _checkemail
                ? Container(
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                    height: 0,
                  )
                : Text(
                    'The information you enter does not match our records.',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              onChanged: (text) {
                if (text.length > 0 && !_checkemail) {
                  setState(() {
                    _checkemail = true;
                  });
                }
              },
              style:
                  TextStyle(color: _checkemail ? Colors.black38 : Colors.red),
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'E-mail',
                hintStyle: CustomTextStyle.formField(context),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: _checkemail ? Colors.black38 : Colors.red,
                        width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: _checkemail ? Colors.black38 : Colors.red,
                        width: 1.0)),
                prefixIcon: _checkemail
                    ? const Icon(
                        Icons.email,
                        color: Colors.black38,
                      )
                    : const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
              ),
              obscureText: false,
            ),
          ),
        ),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(30),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextField(
              style: TextStyle(color: Colors.black38),
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: CustomTextStyle.formField(context),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38, width: 1.0)),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black38,
                ),
              ),
              obscureText: true,
            ),
          ),
        ),
      ],
    );
  }

  _showDialog(bool customer) {
    if (!customer) {
      String data = _emailController.text;
      if (data.length != 0) {
        setState(() {
          _checkemail = false;
        });
        showDialog(
            context: context, builder: (_) => new ErrorDialog(resetGame));
      } else {
        Navigator.pushNamed(context, '/c_smsverification');
      }
    } else {
      String data = _phoneController.text;
      if (data.length != 0) {
        setState(() {
          _checkphone = false;
        });
      } else {
        Navigator.pushNamed(context, '/password_verify');
      }
    }
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
  }
}

class CustomTextStyle {
  static TextStyle formField(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
        fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black38);
  }

  static TextStyle title(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
        fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle subTitle(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);
  }

  static TextStyle button(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white);
  }

  static TextStyle body(BuildContext context) {
    return Theme.of(context).textTheme.title.copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);
  }
}

class _NumberTextInputFormatter extends TextInputFormatter {
  int _whichNumber;
  _NumberTextInputFormatter(this._whichNumber);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    switch (_whichNumber) {
      case 1:
        {
          if (newTextLength >= 1) {
            newText.write('(');
            if (newValue.selection.end >= 1) selectionIndex++;
          }
          if (newTextLength >= 4) {
            newText.write(
                newValue.text.substring(0, usedSubstringIndex = 3) + ') ');
            if (newValue.selection.end >= 3) selectionIndex += 2;
          }
          if (newTextLength >= 7) {
            newText.write(
                newValue.text.substring(3, usedSubstringIndex = 6) + '-');
            if (newValue.selection.end >= 6) selectionIndex++;
          }
          if (newTextLength >= 11) {
            newText.write(
                newValue.text.substring(6, usedSubstringIndex = 10) + ' ');
            if (newValue.selection.end >= 10) selectionIndex++;
          }
          break;
        }
      case 90:
        {
          if (newTextLength >= 5) {
            newText.write(
                newValue.text.substring(0, usedSubstringIndex = 5) + ' ');
            if (newValue.selection.end >= 6) selectionIndex++;
          }
          break;
        }
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
