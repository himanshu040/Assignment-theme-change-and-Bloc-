import 'package:assignment/Model/responseerror.dart';
import 'package:assignment/Repository/getOtpRepo.dart';
import 'package:assignment/Screen/login.dart';
import 'package:assignment/bloc/getotp_bloc/getotp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorScreenBuilder extends StatefulWidget {
  ErrorScreenBuilder(this.responseErrorJ,{Key? key}) : super(key: key);
  ResponseErrorJ responseErrorJ;
  @override
  State<ErrorScreenBuilder> createState() => _ErrorScreenBuilderState();
}

class _ErrorScreenBuilderState extends State<ErrorScreenBuilder> {

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
                widget.responseErrorJ.errors[0].message,
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
