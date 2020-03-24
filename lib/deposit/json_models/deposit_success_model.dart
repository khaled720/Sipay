class DepositSuccessModel {
  String status;
  String message;
  String bankName;
  String siPayBankName;
  var iban;
  var pnr;
  String amount;
  var currencyText;

  DepositSuccessModel(this.status, this.message, this.bankName,
      this.siPayBankName, this.iban, this.pnr, this.amount, this.currencyText);

  factory DepositSuccessModel.test() {
    return DepositSuccessModel(
        'Success',
        'Your deposit request was successfully created',
        'bank',
        'Sipay Elektronik Money and Payment Services Inc.',
        'TR89 9797 9871 6541 6547 1232 48',
        '987541',
        '102,00',
        'TRY');
  }
}
