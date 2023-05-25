// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String uid;
  String email;
  bool emailVerified;
  bool isAnonymous;
  List<ProviderDatum> providerData;
  StsTokenManager stsTokenManager;
  String createdAt;
  String lastLoginAt;
  String apiKey;
  String appName;

  Login({
    required this.uid,
    required this.email,
    required this.emailVerified,
    required this.isAnonymous,
    required this.providerData,
    required this.stsTokenManager,
    required this.createdAt,
    required this.lastLoginAt,
    required this.apiKey,
    required this.appName,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    uid: json["uid"],
    email: json["email"],
    emailVerified: json["emailVerified"],
    isAnonymous: json["isAnonymous"],
    providerData: List<ProviderDatum>.from(json["providerData"].map((x) => ProviderDatum.fromJson(x))),
    stsTokenManager: StsTokenManager.fromJson(json["stsTokenManager"]),
    createdAt: json["createdAt"],
    lastLoginAt: json["lastLoginAt"],
    apiKey: json["apiKey"],
    appName: json["appName"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "email": email,
    "emailVerified": emailVerified,
    "isAnonymous": isAnonymous,
    "providerData": List<dynamic>.from(providerData.map((x) => x.toJson())),
    "stsTokenManager": stsTokenManager.toJson(),
    "createdAt": createdAt,
    "lastLoginAt": lastLoginAt,
    "apiKey": apiKey,
    "appName": appName,
  };
}

class ProviderDatum {
  String providerId;
  String uid;
  dynamic displayName;
  String email;
  dynamic phoneNumber;
  dynamic photoUrl;

  ProviderDatum({
    required this.providerId,
    required this.uid,
    this.displayName,
    required this.email,
    this.phoneNumber,
    this.photoUrl,
  });

  factory ProviderDatum.fromJson(Map<String, dynamic> json) => ProviderDatum(
    providerId: json["providerId"],
    uid: json["uid"],
    displayName: json["displayName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    photoUrl: json["photoURL"],
  );

  Map<String, dynamic> toJson() => {
    "providerId": providerId,
    "uid": uid,
    "displayName": displayName,
    "email": email,
    "phoneNumber": phoneNumber,
    "photoURL": photoUrl,
  };
}

class StsTokenManager {
  String refreshToken;
  String accessToken;
  int expirationTime;

  StsTokenManager({
    required this.refreshToken,
    required this.accessToken,
    required this.expirationTime,
  });

  factory StsTokenManager.fromJson(Map<String, dynamic> json) => StsTokenManager(
    refreshToken: json["refreshToken"],
    accessToken: json["accessToken"],
    expirationTime: json["expirationTime"],
  );

  Map<String, dynamic> toJson() => {
    "refreshToken": refreshToken,
    "accessToken": accessToken,
    "expirationTime": expirationTime,
  };
}
