import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class pPolicy extends StatefulWidget {
  pPolicy({Key key}) : super(key: key);

  @override
  _pPolicyState createState() => _pPolicyState();
}

class _pPolicyState extends State<pPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

  appBar: AppBar(
                centerTitle: true,
                title: Text(
 translator.translate("PPplicy")
,

                ),
                flexibleSpace: Image(
                  image: AssetImage('assets/appbar_bg.png'),
                  height: 100,
                  fit: BoxFit.fitWidth,
                ),
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
                actions: <Widget>[
                  IconButton(
                    padding: const EdgeInsets.only(right: 20.0),
                    icon: Icon(
                      FontAwesomeIcons.commentAlt,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // do something
                    },
                  )
                ],
              ),

body:Padding(
  padding:  EdgeInsets.all(15.0),
  child:   SingleChildScrollView(
  
  
  
  child: Text(
  
    "Like any other environment, online fraud attempts are actively being tried. At this point, we would like you to know that SiPay Electronic Money and Payment Services Inc. has taken the necessary measures to ensure your safety using all the facilities provided by the technology to minimize these risks. Investing in security in parallel with the development of technology and increasing threats is our priority as Sipay Electronic Money and Payment Services Inc.\nAs a conscious individual who uses the Internet, you can experience a safer shopping experience by paying attention to the following hustled.\n• Use the https://www.sipay.com.tr address to perform your electronic money loading.\n• The green lock icon that appears in the address bar of the internet browser means that our site is SiPay Electronic Money and Payment Services Inc. and you can use it securely.\n• Do not rely on links on other websites or emails. Do not use these links for access.\n• If you wish to access your account via our website, the single-use SMS password is transmitted to your phone. If you have any glitches/problems with the transmission of your disposable password to your mobile phone as an SMS message, please call our call center at +90 212 706 11 12 immediately or fill out the contact form on our website.\n• A collection of your account number, user information and password. SiPay Electronic Money and Payment Services Inc. is not responsible for any damages and losses arising from the use of your password by third parties. As a user, your rights and responsibilities are included in the framework agreement you have signed with our company.\n• Do not share your account password with anyone, including company staff, to avoid exposure to fraud attempts. In case of suspicion of fraud, you should innotime ly inform our call center +90 212 706 11 12.\n• We recommend that you do not carry your account information with you in writing/print. If necessary, it will prevent account theft from keeping the written/printed version of the relevant information out of anyone's reach.\n• Notice the presence of people watching the keyboard or screen when logging in.- SiPay Electronic Money and Payment Services Inc.; users never send emails asking for passwords, passwords, account information, usernames. Mark such emails as spam.\n• You can follow your transaction and balance information at https://www.sipay.com.tr.\n• Receipts for your actions will be forwarded to your e-mail address or contact address registered to our system in the event of your request.\n• If your phone sent sms password is lost, stolen, forced to take away, please call our call center +90 212 706 11 12 to prevent potential damage.\n• You can contact your complaints about the disruptions you have experienced in the purchase of services by calling our call center +90 706 11 12 or to those concerned in the Opinion / Suggestion section on the http://www.sipay.com.tr/ internet address.\n• Information about the services offered, interruptions, announcements and warnings can be found at the https://www.sipay.com.tr/ internet address or you can request information by calling our call center +90 706 212 11 12.\n• Do not discredit information from our https://www.sipay.com.tr/ internet address or through any channel other than our call center +90 212 706 11 12."
  
  ,style: TextStyle(
  
 // fontSize: 18,
fontWeight: FontWeight.bold,
  
  color: Colors.black
  
  
  
  
  
  ),
  
  ),
  
  
  
  ),
)
    );
  }
}