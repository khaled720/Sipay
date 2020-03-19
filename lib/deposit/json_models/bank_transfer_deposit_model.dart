class BankTransferModel {
  String header;
  String abailable;
  List<String> abailableBalances;
  String description;
  List<String> bankname;
  String youcan;
  String hintBank;
  String hintAmount;
  List<String> trys;
  String hintRegister;
  String hintIban;
  String hintPNR;
  String button;

  BankTransferModel(
      {this.header,
      this.abailable,
      this.abailableBalances,
      this.description,
      this.bankname,
      this.youcan,
      this.hintBank,
      this.hintAmount,
      this.trys,
      this.hintRegister,
      this.hintIban,
      this.hintPNR,
      this.button});

  BankTransferModel.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    abailable = json['abailable'];
    abailableBalances = json['abailable_balances'].cast<String>();
    description = json['description'];
    bankname = json['bankname'].cast<String>();
    youcan = json['youcan'];
    hintBank = json['hint_bank'];
    hintAmount = json['hint_amount'];
    trys = json['trys'].cast<String>();
    hintRegister = json['hint_register'];
    hintIban = json['hint_iban'];
    hintPNR = json['hint_PNR'];
    button = json['button'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['abailable'] = this.abailable;
    data['abailable_balances'] = this.abailableBalances;
    data['description'] = this.description;
    data['bankname'] = this.bankname;
    data['youcan'] = this.youcan;
    data['hint_bank'] = this.hintBank;
    data['hint_amount'] = this.hintAmount;
    data['trys'] = this.trys;
    data['hint_register'] = this.hintRegister;
    data['hint_iban'] = this.hintIban;
    data['hint_PNR'] = this.hintPNR;
    data['button'] = this.button;
    return data;
  }
}
