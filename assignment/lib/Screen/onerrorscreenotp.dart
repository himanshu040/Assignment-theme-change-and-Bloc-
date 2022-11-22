import 'package:assignment/Model/responseerror.dart';
import 'package:assignment/Model/responseerrorotp.dart';
import 'package:assignment/Repository/getOtpRepo.dart';
import 'package:assignment/Screen/login.dart';
import 'package:assignment/bloc/getotp_bloc/getotp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorScreenBuilderOtp extends StatefulWidget {
  ErrorScreenBuilderOtp(this.responseErrorOtp,{Key? key}) : super(key: key);
  ResponseErrorOtp responseErrorOtp;
  @override
  State<ErrorScreenBuilderOtp> createState() => _ErrorScreenBuilderOtpState();
}

class _ErrorScreenBuilderOtpState extends State<ErrorScreenBuilderOtp> {

  final GetOtpBloc _getOtpBloc=GetOtpBloc(GetOtpRepo());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error"),

      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                "Error!",
                style: TextStyle(color: Colors.red,fontSize: 50.00),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.responseErrorOtp.errors[0].message,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> _onBackPressed ()async
  {

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> BlocProvider<GetOtpBloc>.value(
      value: _getOtpBloc,
      child: const login(),
    )));
    return await true;
  }
}
