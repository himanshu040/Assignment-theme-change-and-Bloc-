
import 'dart:convert';

class ResponseGetOtp {
  ResponseGetOtp({
    required this.data,
  });

  Data data;

  factory ResponseGetOtp.fromJson(String str) => ResponseGetOtp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseGetOtp.fromMap(Map<String, dynamic> json) => ResponseGetOtp(
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data.toMap(),
  };
}

class Data {
  Data({
    required this.tsnId,
  });

  String tsnId;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    tsnId: json["tsnId"],
  );

  Map<String, dynamic> toMap() => {
    "tsnId": tsnId,
  };
}
