class RequestWithdrawUiModel {
  String header;
  String abailable;
  List<String> abailableBalances;
  String tobank;
  String select;
  List<String> accountSelect;
  List<String> bankSelect;
  List<String> withdrawField;
  List<String> trys;
  List<String> button;
  String save;

  RequestWithdrawUiModel(
      {this.header,
      this.abailable,
      this.abailableBalances,
      this.tobank,
      this.select,
      this.accountSelect,
      this.bankSelect,
      this.withdrawField,
      this.trys,
      this.button,
      this.save});

  RequestWithdrawUiModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    tobank = json['tobank'];
    select = json['select'];
    accountSelect = json['account_select'].cast<String>();
    bankSelect = json['bank_select'].cast<String>();
    withdrawField = json['withdraw_field'].cast<String>();
    trys = json['trys'].cast<String>();
    button = json['button'].cast<String>();
    save = json['save'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['tobank'] = this.tobank;
    data['select'] = this.select;
    data['account_select'] = this.accountSelect;
    data['bank_select'] = this.bankSelect;
    data['withdraw_field'] = this.withdrawField;
    data['trys'] = this.trys;
    data['button'] = this.button;
    data['save'] = this.save;
    return data;
  }
}
