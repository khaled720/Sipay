class AvailableBankModel {
  int id;
  String code;
  String name;
  String issuerName;
  String clientID;
  String userName;
  String password;
  var storeKey;
  var storeType;
  var gate3DUrlType;
  var apiUrl;
  String apiUserName;
  String apiPassword;
  String address;
  String country;
  String logo;
  int status;
  int isShownInAdmin;
  int isShowInMerchant;
  int isShownInUser;
  String createdAt;
  String updatedAt;

  AvailableBankModel(
      {this.id,
      this.code,
      this.name,
      this.issuerName,
      this.clientID,
      this.userName,
      this.password,
      this.storeKey,
      this.storeType,
      this.gate3DUrlType,
      this.apiUrl,
      this.apiUserName,
      this.apiPassword,
      this.address,
      this.country,
      this.logo,
      this.status,
      this.isShownInAdmin,
      this.isShowInMerchant,
      this.isShownInUser,
      this.createdAt,
      this.updatedAt});

  factory AvailableBankModel.fromMap(var map) {
    return AvailableBankModel(
        id: map['id'],
        code: map['code'],
        name: map['name'],
        issuerName: map['issuer_name'],
        userName: map['user_name'],
        password: map['password'],
        storeKey: map['store_key'],
        storeType: map['store_type'],
        gate3DUrlType: map['gate_3d_url'],
        apiUrl: map['api_url'],
        apiUserName: map['api_user_name'],
        apiPassword: map['api_password'],
        address: map['address'],
        country: map['country'],
        logo: map['logo'],
        status: map['status'],
        isShownInAdmin: map['is_shown_in_admin'],
        isShowInMerchant: map['is_shown_in_merchant'],
        isShownInUser: map['is_shown_in_user'],
        createdAt: map['created_at'],
        updatedAt: map['updated_at']);
  }
}
