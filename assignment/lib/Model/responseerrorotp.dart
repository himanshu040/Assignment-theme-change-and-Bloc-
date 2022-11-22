// To parse this JSON data, do
//
//     final responseErrorOtp = responseErrorOtpFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ResponseErrorOtp {
  ResponseErrorOtp({
    required this.errors,
  });

  List<Error> errors;

  factory ResponseErrorOtp.fromJson(String str) => ResponseErrorOtp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseErrorOtp.fromMap(Map<String, dynamic> json) => ResponseErrorOtp(
    errors: List<Error>.from(json["errors"].map((x) => Error.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "errors": List<dynamic>.from(errors.map((x) => x.toMap())),
  };
}

class Error {
  Error({
    required this.message,
    required this.code,
  });

  String message;
  String code;

  factory Error.fromJson(String str) => Error.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Error.fromMap(Map<String, dynamic> json) => Error(
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "code": code,
  };
}
