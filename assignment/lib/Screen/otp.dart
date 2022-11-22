
import 'package:assignment/Model/responsegetotp.dart';
import 'package:assignment/Repository/getOtpRepo.dart';
import 'package:assignment/Screen/details.dart';
import 'package:assignment/Screen/login.dart';
import 'package:assignment/Screen/onerrorscreenotp.dart';
import 'package:assignment/bloc/getDetails_bloc/getdetails_bloc.dart';
import 'package:assignment/bloc/getotp_bloc/getotp_bloc.dart';
import 'package:assignment/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatefulWidget {
   Otp(this.data,{Key? key}) : super(key: key);
 final ResponseGetOtp data;
  @override
  State<Otp> createState() => OtpState();
}

class OtpState extends State<Otp> {

  late FocusNode otpfocus;
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _fieldOne = TextEditingController();
   TextEditingController _fieldTwo = TextEditingController();
   TextEditingController _fieldThree = TextEditingController();
   TextEditingController _fieldFour = TextEditingController();
   TextEditingController _fieldFive = TextEditingController();
   TextEditingController _fieldSix = TextEditingController();
  String? _fullOtp;
   late String _comingSms;

  @override
  void initState() {

    _fieldOne  = TextEditingController();
    _fieldTwo = TextEditingController();
    _fieldThree = TextEditingController();
    _fieldFour = TextEditingController();
    _fieldFive = TextEditingController();
    _fieldSix = TextEditingController();
    _textEditingController1 = TextEditingController();
    otpfocus=FocusNode();
    initSmsListener();
    super.initState();
  }
  Future<void> initSmsListener() async {
    String? comingSms;
    try {
      print("COming sms input");
      comingSms = await AltSmsAutofill().listenForSms;
      print("ComingSms=======${comingSms}");
    } on PlatformException {
      print("SMSSSSSS in exception");
      comingSms = '';
    }
    //if (!mounted) return;
    setState(() {
      _comingSms = comingSms!;
      print("====>Message: ${_comingSms}");
     // print("${_comingSms[32]}");
     //  _fieldOne.text = _comingSms[26];
     //  _fieldTwo.text = _comingSms[27];
     //  _fieldThree.text =_comingSms[28];
     //  _fieldFour.text = _comingSms[29];
     //  _fieldFive.text = _comingSms[30];
     //  _fieldSix.text  =  _comingSms[31];
      _textEditingController1.text=_comingSms[26]+_comingSms[27]+_comingSms[28]+_comingSms[29]+_comingSms[30]+_comingSms[31];
    });
  }
  @override
  void dispose() {

    AltSmsAutofill().unregisterListener();
    super.dispose();

  }


  final GetOtpBloc _getOtpBloc=GetOtpBloc(GetOtpRepo());
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetDetailsBloc,GetDetailsState>(listener:(context,state){},
    builder:(context,state){
      if(state is GetDetailsLoaded)
      {

        Navigator.pushAndRemoveUntil<void>(context, MaterialPageRoute<void>(builder: (_) => Details(state.data)), ModalRoute.withName('/'),);
        return Container();
      }
      else
      if(state is GetDetailsLoading)
        {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      else
      if(state is GetDetailsError)
        {
          Future.delayed(Duration.zero,(){
            Navigator.push(context, MaterialPageRoute(builder: (_) => ErrorScreenBuilderOtp(state.data)));
          });
          return Container();
        }
      else
        {
          return getPin();
        }
    } ,
    ) ;
    // return getUi();
  }
  Widget getUi()
  {
    String trans=widget.data.data.tsnId;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("otp screen"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Phone Number Verification'),
            const SizedBox(
              height: 30,
            ),
            // Implement 4 input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpInput(_fieldOne, true),
                OtpInput(_fieldTwo, false),
                OtpInput(_fieldThree, false),
                OtpInput(_fieldFour, false),
                OtpInput(_fieldFive, false),
                OtpInput(_fieldSix, false),

              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _fullOtp = _fieldOne.text +
                        _fieldTwo.text +
                        _fieldThree.text +
                        _fieldFour.text+
                        _fieldFive.text+
                        _fieldSix.text
                    ;
                  });
                  print("FULL:$_fullOtp");
                  return BlocProvider.of<GetDetailsBloc>(context).add(SendOtp(_fullOtp!,trans));
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }

  Widget getPin()
  {
    String trans=widget.data.data.tsnId;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("otp screen"),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Phone Number Verification'),
            const SizedBox(
              height: 30,
            ),
            // Implement 6 input fields
            PinCodeTextField(
              autoFocus: true,
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.pinkAccent,
                  selectedColor: Colors.blue,
                  selectedFillColor: Colors.white,
                  activeFillColor: Colors.white,
                  activeColor: Colors.blueAccent
              ),
              cursorColor: Colors.black,
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: _textEditingController1,
              keyboardType: TextInputType.text,
              boxShadows: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {
                //do something or move to next screen when code complete
              },
              onChanged: (value) {
                print("ahasdbdb=============$value");
              }
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _fullOtp = _textEditingController1.text;
                  });
                  print("FULL:$_fullOtp");
                  return BlocProvider.of<GetDetailsBloc>(context).add(SendOtp(_fullOtp!,trans));
                },
                child: const Text('Submit')),
            ElevatedButton(
                onPressed: initSmsListener,
                child: const Text('Fill otp')),
          ],
        ) ,
      ),
    );

  }
  Future<bool> _onBackPressed ()async
  {
    Navigator.of(context).pushReplacement
      (MaterialPageRoute(builder: (_)=> BlocProvider<GetOtpBloc>.value(
      value: _getOtpBloc,
      child: const login(),
    )));
    return await true;
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
