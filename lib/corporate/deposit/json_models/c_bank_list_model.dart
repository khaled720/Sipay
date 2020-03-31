class CorporateBankModel {
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

  CorporateBankModel(
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

  factory CorporateBankModel.empty() {
    return CorporateBankModel(0, 'Loading...', 0, 0, '', '', '', '', '', 0, 0, '', '');
  }

  factory CorporateBankModel.fromMap(Map values) {
    return CorporateBankModel(
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
