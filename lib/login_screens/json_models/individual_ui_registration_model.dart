class RegistrationModel {
  String header;
  String registration;
  String enter;
  User user;
  String already;
  String login;
  String button;

  RegistrationModel(
      {this.header,
      this.registration,
      this.enter,
      this.user,
      this.already,
      this.login,
      this.button});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    registration = json['REGISTRATION'];
    enter = json['enter'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    already = json['already'];
    login = json['login'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['REGISTRATION'] = this.registration;
    data['enter'] = this.enter;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['already'] = this.already;
    data['login'] = this.login;
    data['button'] = this.button;
    return data;
  }
}

class User {
  String agreement;
  String privacy;

  User({this.agreement, this.privacy});

  User.fromJson(Map<String, dynamic> json) {
    agreement = json['agreement'];
    privacy = json['privacy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agreement'] = this.agreement;
    data['privacy'] = this.privacy;
    return data;
  }
}
