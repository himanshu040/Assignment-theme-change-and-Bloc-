class ApiBaseHelper {
  Map<String, String> header(String timestamp, String signature){
    Map<String, String> map={
      "Accept":"application/json",
      "Accept-Language":"en",
      "Content-Type":"application/json",
      "timestamp":timestamp,
      "signature":signature
    };
    return map;
  }
}