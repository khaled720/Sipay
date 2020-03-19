class WithdrawUIModel {
  String header;
  String abailable;
  List<String> abailableBalances;
  String howto;
  List<String> button;
  List<String> footerTab;

  WithdrawUIModel(
      {this.header,
      this.abailable,
      this.abailableBalances,
      this.howto,
      this.button,
      this.footerTab});

  WithdrawUIModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    howto = json['howto'];
    button = json['button'].cast<String>();
    footerTab = json['footer_tab'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['howto'] = this.howto;
    data['button'] = this.button;
    data['footer_tab'] = this.footerTab;
    return data;
  }
}
