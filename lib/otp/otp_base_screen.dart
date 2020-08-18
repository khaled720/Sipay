import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttersipay/loading_widget.dart';
import 'package:fluttersipay/utils/constants.dart';
import 'package:fluttersipay/utils/custom_text_style.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simple_timer/simple_timer.dart';
import 'package:translator/translator.dart' as translator;
class OTPBaseScreen extends StatelessWidget {
  final showLoad;
  final phoneNumber;
  final double timerPercent;
  final secondsLeft;
  
  final Function resendOTP;
  final Function verifyOTP;
  final Function onFailure;
  final Function onSuccess;
  final String errorText;
  final TextEditingController smsController;

  OTPBaseScreen(
      {@required this.showLoad,
      @required this.phoneNumber,
      @required this.timerPercent,
      @required this.secondsLeft,
      @required this.resendOTP,
      @required this.verifyOTP,
      @required this.onFailure,
      @required this.onSuccess,
      @required this.errorText,
      @required this.smsController});



      

  @override
  Widget build(BuildContext context) {
  


         return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setWidth(60),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter the SMS verification code you received on your phone.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(30),
            ),
        
            Visibility(
              visible: phoneNumber != null ?? false,
              child: Container(
                  width: ScreenUtil.getInstance().setHeight(780),
                  height: ScreenUtil.getInstance().setHeight(100),
                  decoration: new BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Your phone number',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            phoneNumber ?? '',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
             
             
             
             
             Container(width: 150,
             height: 150,
               child: SimpleTimer(
          status: TimerStatus.start,
          duration: Duration(seconds: 00,minutes: 3),
          backgroundColor: Colors.white,
          progressIndicatorDirection:TimerProgressIndicatorDirection.clockwise ,
          progressIndicatorColor: Colors.blue,
          progressTextStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Colors.blue[700]),
strokeWidth: 12,

      ),
             ),
             
               /*    CircularPercentIndicator(
                      radius: ScreenUtil.getInstance().setHeight(160),
                      lineWidth: 10.0,
                      percent: timerPercent != null ? timerPercent : 1.0,
                      backgroundColor: Colors.white10,
                      center: GradientText(secondsLeft,
                          gradient: otpGradient,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      linearGradient: otpGradient), */
                
                  Text(
                    'Remaining time to enter your code',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              height: ScreenUtil.getInstance().setHeight(430),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, right: 30.0),
              child: TextField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                maxLength: 6,
                controller: smsController,
                decoration: InputDecoration(
                  errorText: errorText,//errorText,
                  hintStyle: CustomTextStyle.formField(context),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black12, width: 1.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black12, width: 1.0)),
                  prefixIcon: const Icon(
                    Icons.message,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(5),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40),
              child: Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    resendOTP(onSuccess, onFailure);
                  },
                  child: Text(
                    'Resend the code',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(10),
            ),
            Container(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      // set the default style for the children TextSpans
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                            text:
                                'By clicking the Verify button, you are deemed to have read and accepted the',
                            style: TextStyle(color: Colors.black45)),
                        TextSpan(
                            text: 'User Privacy',
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(
                            text: 'and the',
                            style: TextStyle(color: Colors.black45)),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(color: Colors.blue)),
                      ])),
              width: ScreenUtil.getInstance().setWidth(660),
            ),
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(20),
            ),
            Container(
              child: FlatButton(
                onPressed: () {
                  verifyOTP(onSuccess, onFailure);
                },
                color: Colors.blue,
                disabledColor: Colors.blue,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'VERIFY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              width: ScreenUtil.getInstance().setWidth(690),
            )
          ],
        ),
        LoadingWidget(
          isVisible: showLoad,
        )
      ],
    );
    

  
  }
}
