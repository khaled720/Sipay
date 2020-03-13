class KYCVerificationModel {
  String header;
  String alert;
  List<String> inputField;
  String button;

  KYCVerificationModel({this.header, this.alert, this.inputField, this.button});

  KYCVerificationModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    alert = json['alert'];
    inputField = json['input_field'].cast<String>();
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['alert'] = this.alert;
    data['input_field'] = this.inputField;
    data['button'] = this.button;
    return data;
  }
}
