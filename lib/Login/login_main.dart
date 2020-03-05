import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/Login/login_slide.dart';
import 'package:fluttersipay/Login/reset_password.dart';

TextEditingController _phoneController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

final _formKey = GlobalKey<FormState>();

class Login_main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyLoginPage(),
    );
  }
}

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key}) : super(key: key);
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  bool _customer = true;
  bool _remember = false;
  void _updatecustomer(){
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
        child:  Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/home_logo.png', width: ScreenUtil.getInstance().setWidth(300), height: ScreenUtil.getInstance().setHeight(190)),
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
                                bottom: BorderSide( //                   <--- left side
                                  color: _customer ?Colors.blue :Colors.black26,
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
                                    child:  new Text('BİREYSEL',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: _customer ?Colors.blue :Colors.black26,
                                          fontWeight: FontWeight.bold),

                                    ),
                                  )
                              ),
                            )
                        ),
                      ),
                      Expanded(
                        child: Container(
                            decoration: new BoxDecoration(
                              border: Border(
                                bottom: BorderSide( //                   <--- left side
                                  color: _customer ?Colors.black26 :Colors.blue,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: ScreenUtil.getInstance().setWidth(345),
                                child:  OutlineButton(
                                  onPressed: _updatecustomer,
                                  borderSide: new BorderSide(
                                    style: BorderStyle.none,
                                  ),
                                  child: new Text('KURUMSAL',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: _customer ?Colors.black26 :Colors.blue,
                                        fontWeight: FontWeight.bold),

                                  ),
                                ),
                              ),
                            )
                        ),
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
                      child: _customer? _showconsumer(context) : _showcorporate(),
                    ),
                    SizedBox(
                      height: ScreenUtil.getInstance().setHeight(20),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child:  Row(
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
                                Text("Beni hatırla"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                onPressed: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ResetPassword()),
                                  );
                                },
                                child: Text(
                                  'Şifreni mi unuttun?',
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
                        disabledColor: Colors.blue,
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'GİRİŞ YAP',
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
                      child: _customer? _noaccount() :null,
                    ),
                  ],
                ),
              ),
              width: ScreenUtil.getInstance().setWidth(750),
              height: ScreenUtil.getInstance().setHeight(610),
            ),
            Container(
              padding: EdgeInsets.only(left: 40.0, right: 40.0),
              child: Text(
                'HAZİRAN AYI BOYUNCA ALIŞVERİŞLERİNİZ 10% İNDİRİMLİ!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Widget _noaccount(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            child:Text(
                'Hesabınız mı yok?'
            )
        ),
        Container(
          child:FlatButton(
            child: Text(
              'Kayıt olun',
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
            padding: EdgeInsets.only(),
            child: TextFormField(
              style: TextStyle(color: Colors.black38),
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: 'Telefon numaranız',
                hintStyle: CustomTextStyle.formField(context),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black38, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black38, width: 1.0)),
                prefixIcon: const Icon(
                  Icons.phone,
                  color: Colors.black38,
                ),
              ),
              obscureText: false,
            ),
          ),
        ),
      ],
    );
  }

  Widget _showcorporate() {

    return Form(
      key: _formKey,
      child:  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(30),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(),
            child: TextFormField(
              style: TextStyle(color: Colors.black38),
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'E-posta adresiniz',
                hintStyle: CustomTextStyle.formField(context),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black38, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black38, width: 1.0)),
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.black38,
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Girdiğiniz bilgiler kayıtlarımızla uyuşmamaktadır.';
                }
                return null;
              },
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
            child: TextFormField(
              style: TextStyle(color: Colors.black38),
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Şifreniz',
                hintStyle: CustomTextStyle.formField(context),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black38, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black38, width: 1.0)),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.black38,
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter password.';
                }
                return null;
              },
              obscureText: true,
            ),
          ),
        ),
      ],
    ),
    );
  }

  _showDialog() {
    if(_formKey.currentState.validate()){

    }
  }
}

class CustomTextStyle {
  static TextStyle formField(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .title
        .copyWith(
        fontSize: 18.0, fontWeight: FontWeight.normal, color: Colors.black38);
  }

  static TextStyle title(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .title
        .copyWith(
        fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle subTitle(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .title
        .copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);
  }

  static TextStyle button(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .title
        .copyWith(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white);
  }

  static TextStyle body(BuildContext context) {
    return Theme
        .of(context)
        .textTheme
        .title
        .copyWith(
        fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);
  }
}