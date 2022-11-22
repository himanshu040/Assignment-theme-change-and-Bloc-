// To parse this JSON data, do
//
//     final requestGetDetails = requestGetDetailsFromJson(jsonString);

import 'dart:convert';

RequestGetDetails requestGetDetailsFromJson(String str) => RequestGetDetails.fromJson(json.decode(str));

String requestGetDetailsToJson(RequestGetDetails data) => json.encode(data.toJson());

class RequestGetDetails {
  RequestGetDetails({
    this.otp,
    this.tsnId,
  });

  String? otp;
  String? tsnId;

  factory RequestGetDetails.fromJson(Map<String, dynamic> json) => RequestGetDetails(
    otp: json["otp"],
    tsnId: json["tsnId"],
  );

  Map<String, dynamic> toJson() => {
    "otp": otp,
    "tsnId": tsnId,
  };
}
