import 'dart:async';

import 'package:assignment/Repository/getOtpRepo.dart';
import 'package:assignment/Screen/encrypt.dart';
import 'package:assignment/bloc/getotp_bloc/getotp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'login.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late AnimationController controller;
  final GetOtpBloc _getOtpBloc=GetOtpBloc(GetOtpRepo());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(const Duration(seconds: 4),
       ()=>
        //    Navigator.pushReplacement(
        // context, MaterialPageRoute(builder: (context) => HomeView())));
           Navigator.of(context).pushReplacement
             (MaterialPageRoute(builder: (_)=> BlocProvider<GetOtpBloc>.value(
             value: _getOtpBloc,
             child: const login(),
           ))) );
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 500,
        height: 1000,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/splash.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        // constraints: BoxConstraints.expand(),
      ),
    );
  }
}
