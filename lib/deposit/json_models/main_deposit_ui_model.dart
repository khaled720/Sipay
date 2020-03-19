class DepositMainUIModel {
  String header;
  String abailable;
  List<String> abailableBalances;
  String deposit;
  String choose;
  List<String> method;
  String howto;
  List<String> footerTab;

  DepositMainUIModel(
      {this.header,
      this.abailable,
      this.abailableBalances,
      this.deposit,
      this.choose,
      this.method,
      this.howto,
      this.footerTab});

  DepositMainUIModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    deposit = json['deposit'];
    choose = json['choose'];
    method = json['method'].cast<String>();
    howto = json['howto'];
    footerTab = json['footer_tab'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['deposit'] = this.deposit;
    data['choose'] = this.choose;
    data['method'] = this.method;
    data['howto'] = this.howto;
    data['footer_tab'] = this.footerTab;
    return data;
  }
}
