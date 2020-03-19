class BankModel {
  int id;
  String bankName;
  int currencyID;
  int staticBankID;
  String logo;
  String accountHolderName;
  String iban;
  String accountNo;
  String branchCode;
  int status;
  int availableFor;
  String updatedAt;
  String createdAt;

  BankModel(
      this.id,
      this.bankName,
      this.currencyID,
      this.staticBankID,
      this.logo,
      this.accountHolderName,
      this.iban,
      this.accountNo,
      this.branchCode,
      this.status,
      this.availableFor,
      this.updatedAt,
      this.createdAt);

  factory BankModel.empty() {
    return BankModel(0, 'Loading...', 0, 0, '', '', '', '', '', 0, 0, '', '');
  }

  factory BankModel.fromMap(Map values) {
    return BankModel(
        values['id'],
        values['bank_name'],
        values['currency_id'],
        values['static_bank_id'],
        values['logo'],
        values['account_holder_name'],
        values['iban'],
        values['account_no'],
        values['branch_code'],
        values['status'],
        values['available_for'],
        values['updated_at'],
        values['created_at']);
  }
}
