class SMSVerificationModel {
  String header;
  String enter;
  String your;
  String remain;
  String resend;
  String byclicks;
  String user;
  String state;
  String and;
  String privacy;
  String button;

  SMSVerificationModel(
      {this.header,
      this.enter,
      this.your,
      this.remain,
      this.resend,
      this.byclicks,
      this.user,
      this.state,
      this.and,
      this.privacy,
      this.button});

  SMSVerificationModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    enter = json['enter'];
    your = json['your'];
    remain = json['remain'];
    resend = json['resend'];
    byclicks = json['byclick'];
    user = json['user'];
    state = json['state'];
    and = json['and'];
    privacy = json['privacy'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['enter'] = this.enter;
    data['your'] = this.your;
    data['remain'] = this.remain;
    data['resend'] = this.resend;
    data['byclick'] = this.byclicks;
    data['user'] = this.user;
    data['state'] = this.state;
    data['and'] = this.and;
    data['privacy'] = this.privacy;
    data['button'] = this.button;
    return data;
  }
}
