class CorporateWithdrawalBankModel {
  int id;
  var merchantID;
  int currencyID;
  String bankName;
  var staticBankID;
  String accountHolderName;
  String iban;
  String accountNo;
  var code;
  String branchName;
  var swiftCode;
  var logo;
  int status;
  var createdAt;

  CorporateWithdrawalBankModel(
      this.id,
      this.merchantID,
      this.currencyID,
      this.bankName,
      this.staticBankID,
      this.accountHolderName,
      this.iban,
      this.accountNo,
      this.code,
      this.branchName,
      this.swiftCode,
      this.logo,
      this.status,
      this.createdAt);

  factory CorporateWithdrawalBankModel.empty() {
    return CorporateWithdrawalBankModel(
        0, '', 0, '', '', '', '', '', '', '', '', '', 0, '');
  }

  factory CorporateWithdrawalBankModel.fromMap(Map value) {
    return CorporateWithdrawalBankModel(
        value['id'],
        value['merchant_id'],
        value['currency_id'],
        value['bank_name'],
        value['static_bank_id'],
        value['account_holder_name'],
        value['iban'],
        value['account_no'],
        value['branch_code'],
        value['branch_name'],
        value['swift_code'],
        value['logo'],
        value['status'],
        value['created_at']);
  }
}
