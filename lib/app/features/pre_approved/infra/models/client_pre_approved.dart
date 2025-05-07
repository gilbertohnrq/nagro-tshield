class ClientePreApprovedModel {
  Address? address;
  BankData? bankData;
  DriverLicense? driverLicense;

  ClientePreApprovedModel({this.address, this.bankData, this.driverLicense});

  ClientePreApprovedModel.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    bankData =
        json['bankData'] != null ? BankData.fromJson(json['bankData']) : null;
    driverLicense = json['driverLicense'] != null
        ? DriverLicense.fromJson(json['driverLicense'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (address != null) {
      data['address'] = address!.toJson();
    }
    if (bankData != null) {
      data['bankData'] = bankData!.toJson();
    }
    if (driverLicense != null) {
      data['driverLicense'] = driverLicense!.toJson();
    }
    return data;
  }
}

class Address {
  String? address;
  String? state;
  String? city;
  String? zipCode;
  String? neighbourhood;
  String? number;

  Address(
      {this.address,
      this.state,
      this.city,
      this.zipCode,
      this.neighbourhood,
      this.number});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zipCode'];
    neighbourhood = json['neighbourhood'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['state'] = state;
    data['city'] = city;
    data['zipCode'] = zipCode;
    data['neighbourhood'] = neighbourhood;
    data['number'] = number;
    return data;
  }

  factory Address.mocked({
    String? address,
    String? state,
    String? city,
  }) {
    return Address(
      address: address ?? 'Rua A',
      state: state ?? 'SP',
      city: city ?? 'São Paulo',
    );
  }
}

class BankData {
  String? taxId;
  String? branchNumber;
  String? accountNumber;
  String? lastDigitAccount;
  String? bankNumber;

  BankData(
      {this.taxId,
      this.branchNumber,
      this.accountNumber,
      this.lastDigitAccount,
      this.bankNumber});

  BankData.fromJson(Map<String, dynamic> json) {
    taxId = json['taxId'];
    branchNumber = json['branchNumber'];
    accountNumber = json['accountNumber'];
    lastDigitAccount = json['lastDigitAccount'];
    bankNumber = json['bankNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxId'] = taxId;
    data['branchNumber'] = branchNumber;
    data['accountNumber'] = accountNumber;
    data['lastDigitAccount'] = lastDigitAccount;
    data['bankNumber'] = bankNumber;
    return data;
  }

  factory BankData.mocked({String? taxId, String? branchNumber}) {
    return BankData(
        taxId: taxId ?? '123456789', branchNumber: branchNumber ?? '001');
  }
}

class DriverLicense {
  String? motherName;
  String? state;
  String? number;
  String? issuer;

  DriverLicense({
    this.motherName,
    this.state,
    this.number,
    this.issuer,
  });

  DriverLicense.fromJson(Map<String, dynamic> json) {
    if (json['state'] == 'UF do órgão expedidor') {
      state = '';
    } else {
      state = json['state'];
    }
    motherName = json['motherName'];
    number = json['number'];
    issuer = json['issuer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (data['state'] == 'UF do órgão expedidor') {
      data['state'] = '';
    } else {
      data['state'] = state;
    }
    data['motherName'] = motherName;
    data['number'] = number;
    data['issuer'] = issuer;
    return data;
  }

  factory DriverLicense.mocked({
    String? motherName,
    String? number,
  }) {
    return DriverLicense(
        motherName: motherName ?? 'Maria', number: number ?? 'AB123456');
  }
}
