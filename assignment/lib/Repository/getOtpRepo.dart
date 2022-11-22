import 'dart:convert';

import 'package:assignment/Model/requestgetdetails.dart';
import 'package:assignment/Model/responseerror.dart';
import 'package:assignment/Model/responseerrorotp.dart';
import 'package:assignment/Model/responsegetdetails.dart';
import 'package:assignment/Model/resquestgetotp.dart';
import 'package:assignment/constants/UrlEndPoints.dart';
import 'package:assignment/networking/AppSignature.dart';
import 'package:assignment/networking/apiBaseHelpere.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/responsegetotp.dart';
import 'package:http/http.dart' as http;

import '../encryption.dart';


class GetOtpRepo{
  Future<Object> fetchOtp(String mobileno) async {
    int timestamp=DateTime.now().millisecondsSinceEpoch;
    AppSignatureUtil appSignatureUtil= new AppSignatureUtil();
    ApiBaseHelper apiBaseHelper=new ApiBaseHelper();
    Encrypted encrypted = encrypt(mobileno);
    final pref= await SharedPreferences.getInstance();
    String url=BASE_URL+"generate_otp";
    print(url);
    RequestGetOtp requestGetOtp=new RequestGetOtp(mobile: encrypted.base64);
    String signature= appSignatureUtil.generateSignature(url, "null", 0, timestamp.toString(), requestGetOtp);
    print(signature);
    print(requestGetOtp.mobile);
    print(jsonEncode(requestGetOtp));
    print(apiBaseHelper.header(timestamp.toString(), signature));
    var response = await http.post(
      Uri.parse(
        "https://test-ncf.inroad.in/ncfadmin/custom/auth/generate_otp",
      ),
      body: jsonEncode(requestGetOtp),
      headers: apiBaseHelper.header(timestamp.toString(), signature)
    );
    print("Response:${response.body.toString()}");
    if(response.statusCode==200)
      {
        if(!response.body.toString().contains("errors"))
       {
         await pref.setString("transId",ResponseGetOtp.fromJson(response.body).data.tsnId);
       print(ResponseGetOtp.fromJson(response.body.toString()));
        return ResponseGetOtp.fromJson(response.body);}
        else
          {
            print("Response check:${ResponseErrorJ.fromJson(jsonDecode(response.body.toString())as Map<String,dynamic>).toString()}");
            return ResponseErrorJ.fromJson(jsonDecode(response.body.toString())as Map<String,dynamic>);
          }
          
      }
    else
      {
        debugPrint("Error in API call ${response.statusCode}");
        throw Exception("Failed to load API");
      }
  }

  Future<Object> fetchDetails(String otp, String transId) async
  {

    int timestamp=DateTime.now().millisecondsSinceEpoch;
    AppSignatureUtil appSignatureUtil= new AppSignatureUtil();
    ApiBaseHelper apiBaseHelper=new ApiBaseHelper();
    final pref= await SharedPreferences.getInstance();
    String url=BASE_URL+"otplogin";
    print(url);
    RequestGetDetails requestGetDetails=new RequestGetDetails(otp: otp, tsnId: transId);
    String signature= appSignatureUtil.generateSignature(url, "null", 0, timestamp.toString(), requestGetDetails);
    print(signature);
    print(jsonEncode(requestGetDetails));
    print("Details_Sent: OTP=${requestGetDetails.otp}, TransId=${requestGetDetails.tsnId} ");
    print("Header: ${apiBaseHelper.header(timestamp.toString(), signature)}");
    var response= await http.post(
      Uri.parse(url),
    body: jsonEncode(requestGetDetails),
    headers:apiBaseHelper.header(timestamp.toString(), signature) );
    print("Response:${response.body.toString()}");
    print("Statuscode:${response.statusCode.toString()}");
    if(response.statusCode==200)
      {
        if(!response.body.toString().contains("errors"))
        {
            await pref.setString("token",ResponseGetDetails.fromJson(response.body).data.accessToken);
            await pref.setString("firstname",ResponseGetDetails.fromJson(response.body).data.user.firstName);
            await pref.setString("lastname",ResponseGetDetails.fromJson(response.body).data.user.lastName);
            await pref.setString("fullname",ResponseGetDetails.fromJson(response.body).data.user.fullName);
            await pref.setString("mobile",ResponseGetDetails.fromJson(response.body).data.user.mobile);
            await pref.setString("rolename",ResponseGetDetails.fromJson(response.body).data.user.roleName);
            await pref.setString("statename",ResponseGetDetails.fromJson(response.body).data.user.stateName);
          print(ResponseGetDetails.fromJson(response.body.toString()));
          return ResponseGetDetails.fromJson(response.body);}
        else
        {
          print("Response check:${ResponseErrorOtp.fromJson(response.body.toString()).toString()}");
          return ResponseErrorOtp.fromJson(response.body.toString());
        }
      }
    else
    {
      debugPrint("Error in API call ${response.statusCode}");
      throw Exception("Failed to load API");
    }
   }


}
