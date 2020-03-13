class SMSVerifyModel {
  String header;
  String smsVerification;
  String byclick;
  String privacy;
  String and;
  String privacys;
  String remain;
  String resend;
  String already;
  String login;
  String button;

  SMSVerifyModel(
      {this.header,
      this.smsVerification,
      this.byclick,
      this.privacy,
      this.and,
      this.privacys,
      this.remain,
      this.resend,
      this.already,
      this.login,
      this.button});

  SMSVerifyModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    smsVerification = json['sms_verification'];
    byclick = json['byclick'];
    privacy = json['privacy'];
    and = json['and'];
    privacys = json['privacys'];
    remain = json['remain'];
    resend = json['Resend'];
    already = json['already'];
    login = json['login'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['sms_verification'] = this.smsVerification;
    data['byclick'] = this.byclick;
    data['privacy'] = this.privacy;
    data['and'] = this.and;
    data['privacys'] = this.privacys;
    data['remain'] = this.remain;
    data['Resend'] = this.resend;
    data['already'] = this.already;
    data['login'] = this.login;
    data['button'] = this.button;
    return data;
  }
}
