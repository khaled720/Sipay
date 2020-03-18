class MerchantPanelUIModel {
  String total;
  String available;
  List<String> availableBalances;
  String welcome;
  String last;
  BalanceModel balance;
  ProfileModel profile;
  List<LastActivitiesModel> lastActivities;
  MenuListModel menuList;

  MerchantPanelUIModel(
      {this.total,
      this.available,
      this.availableBalances,
      this.welcome,
      this.last,
      this.balance,
      this.profile,
      this.lastActivities,
      this.menuList});

  MerchantPanelUIModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    available = json['available'];
    availableBalances = json['available_balances'].cast<String>();
    welcome = json['welcome'];
    last = json['last'];
    balance = json['balance'] != null
        ? new BalanceModel.fromJson(json['balance'])
        : null;
    profile = json['profile'] != null
        ? new ProfileModel.fromJson(json['profile'])
        : null;
    if (json['last_activities'] != null) {
      lastActivities = new List<LastActivitiesModel>();
      json['last_activities'].forEach((v) {
        lastActivities.add(new LastActivitiesModel.fromJson(v));
      });
    }
    menuList = json['menu_list'] != null
        ? new MenuListModel.fromJson(json['menu_list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['available'] = this.available;
    data['available_balances'] = this.availableBalances;
    data['welcome'] = this.welcome;
    data['last'] = this.last;
    if (this.balance != null) {
      data['balance'] = this.balance.toJson();
    }
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.lastActivities != null) {
      data['last_activities'] =
          this.lastActivities.map((v) => v.toJson()).toList();
    }
    if (this.menuList != null) {
      data['menu_list'] = this.menuList.toJson();
    }
    return data;
  }
}

class BalanceModel {
  String tot;
  String avail;

  BalanceModel({this.tot, this.avail});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    tot = json['tot'];
    avail = json['avail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tot'] = this.tot;
    data['avail'] = this.avail;
    return data;
  }
}

class ProfileModel {
  String name;
  String phone;

  ProfileModel({this.name, this.phone});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

class LastActivitiesModel {
  String title;
  String value;
  String description;
  String dates;

  LastActivitiesModel({this.title, this.value, this.description, this.dates});

  LastActivitiesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
    description = json['description'];
    dates = json['dates'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    data['description'] = this.description;
    data['dates'] = this.dates;
    return data;
  }
}

class MenuListModel {
  String menu;
  String dashboard;
  String transactions;
  String deposit;
  String withdrawals;
  String exchange;
  List<String> money;
  List<String> settings;
  String security;
  String help;
  String support;
  List<String> language;
  String logout;

  MenuListModel(
      {this.menu,
      this.dashboard,
      this.transactions,
      this.deposit,
      this.withdrawals,
      this.exchange,
      this.money,
      this.settings,
      this.security,
      this.help,
      this.support,
      this.language,
      this.logout});

  MenuListModel.fromJson(Map<String, dynamic> json) {
    menu = json['menu'];
    dashboard = json['dashboard'];
    transactions = json['transactions'];
    deposit = json['deposit'];
    withdrawals = json['withdrawals'];
    exchange = json['exchange'];
    money = json['money'].cast<String>();
    settings = json['settings'].cast<String>();
    security = json['security'];
    help = json['help'];
    support = json['support'];
    language = json['language'].cast<String>();
    logout = json['logout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu'] = this.menu;
    data['dashboard'] = this.dashboard;
    data['transactions'] = this.transactions;
    data['deposit'] = this.deposit;
    data['withdrawals'] = this.withdrawals;
    data['exchange'] = this.exchange;
    data['money'] = this.money;
    data['settings'] = this.settings;
    data['security'] = this.security;
    data['help'] = this.help;
    data['support'] = this.support;
    data['language'] = this.language;
    data['logout'] = this.logout;
    return data;
  }
}

class FooterModel {
  List<String> footerTab;

  FooterModel({this.footerTab});

  FooterModel.fromJson(Map<String, dynamic> json) {
    footerTab = json['footer_tab'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['footer_tab'] = this.footerTab;
    return data;
  }
}
