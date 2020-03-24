class WithdrawalBankModel {
  int id;
  String name;
  var code;
  var symbol;
  var issuerName;
  var address;
  var country;
  var logo;
  int status;

  WithdrawalBankModel(this.id, this.name, this.code, this.symbol,
      this.issuerName, this.address, this.country, this.logo, this.status);

  factory WithdrawalBankModel.empty() {
    return WithdrawalBankModel(
        0, 'No accounts found', '', '', '', '', '', '', 0);
  }

  factory WithdrawalBankModel.fromMap(Map values) {
    return WithdrawalBankModel(
        values['id'],
        values['name'],
        values['code'],
        values['symbol'],
        values['issuer_name'],
        values['address'],
        values['country'],
        values['logo'],
        values['status']);
  }
}
