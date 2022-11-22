import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:assignment/Repository/getOtpRepo.dart';
import 'package:assignment/Screen/errorScreen.dart';
import 'package:assignment/Screen/otp.dart';
import 'package:assignment/Screen/register.dart';
import 'package:assignment/bloc/getDetails_bloc/getdetails_bloc.dart';
import 'package:assignment/bloc/getotp_bloc/getotp_bloc.dart';
import 'package:assignment/themeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late FocusNode mobilefocus;
  String? _comingSms;
  late FocusNode submitButton;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final GetDetailsBloc _getDetailsBloc=GetDetailsBloc(GetOtpRepo());
  @override
  void initState() {
    username.text = ""; //innitail value of text field
    password.text = "";
    super.initState();
    mobilefocus=FocusNode();
    submitButton=FocusNode();
    username=TextEditingController();
  }
  Future<void> initSmsListener() async {
    String? comingSms;
    var pref=await SharedPreferences.getInstance();
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
      //  _fieldSix."text  =  _comingSms[31];
      if(_comingSms!='')
     pref.setString("OTP",_comingSms![26]+_comingSms![27]+_comingSms![28]+_comingSms![29]+_comingSms![30]+_comingSms![31]);
    });
  }

  @override
  void dispose()
  {
    mobilefocus.dispose();
    submitButton.dispose();
    username.dispose();
    super.dispose();
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var locale = Locale('en','IN');
    Get.updateLocale(locale);
    return BlocConsumer<GetOtpBloc,GetOtpState>(
      builder: (context,state){
        if(state is GetOtpLoaded)
        {

          Future.delayed(Duration.zero,(){
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=> BlocProvider<GetDetailsBloc>.value(
              value: _getDetailsBloc,
              child:  Otp(state.data),
            )),(route)=>false);
            });
            return Container();
        }
        else
        if(state is GetOtpLoading)
        {
          return Scaffold(
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else if(state is GetOtpError)
        {
          Future.delayed(Duration.zero, () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) =>ErrorScreenBuilder(state.data) ),
                    (route) => false);
          });
          return Container();
        }
        else {
          return getUi();
        }
      },
      listener: (context,state){} ,
    );

  }

  Widget getUi()
  {
    return Scaffold(
      appBar: AppBar(
    title: Consumer<Themeprovider>(
    builder: (context,theme,snapshot)=>SwitchListTile(
        title: Text("Dark Mode"),

        value: theme.isdarktheme, onChanged: (val){
      theme.changetheme();
    })
    ),
  ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            width: MediaQuery.of(context).size.width,
            child : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Image.asset("images/loginScreen.png",width: MediaQuery.of(context).size.width,),
                SizedBox(
                  height: 30,
                ),
                Text('login'.tr,style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: TextField(

                    controller: username,
                    keyboardType: TextInputType.phone,
                    autofocus: false,
                    onSubmitted: (value) {
                      FocusScope.of(context).requestFocus(mobilefocus);
                    },
                    decoration: InputDecoration(
                        hintText: 'Mobile No',
                        icon:Icon(Icons.numbers)
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // TextField(
                //   controller: password,
                //   decoration: InputDecoration(
                //     hintText: 'password'.tr,
                //     icon: Icon(Icons.lock), //icon at head of input
                //     suffixIcon: Icon(Icons.remove_red_eye),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                // Align(
                //     alignment: Alignment.topRight,
                //     child: Text('forgot'.tr,style: TextStyle(
                //         color: Colors.blue,fontSize: 15
                //     ),)),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width:double.infinity,child: Text('Login',textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 20
                  ),),),
                  onPressed: () =>BlocProvider.of<GetOtpBloc>(context).add(SendData(username.text)),

                ),
                SizedBox(
                  height: 40,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     Container(
                //       height: 1,
                //       width: MediaQuery.of(context).size.width/3,
                //       color: Colors.grey,
                //     ),
                //     Text("OR"),
                //     Container(
                //       height: 1,
                //       width: MediaQuery.of(context).size.width/3,
                //       color: Colors.grey,
                //     )
                //   ],
                // ),
                // SizedBox(
                //   height: 40,
                // ),
                // ElevatedButton(
                //   style: ButtonStyle(
                //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //         RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10.0),
                //         ),
                //       ),
                //       backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
                //   ),
                //   onPressed: () {}, child: Container(
                //   height: 50,
                //   width: double.infinity,
                //   child: Row(
                //     children: [
                //       Image.asset("images/google.png",width: 20,),
                //       SizedBox(width: 40,),
                //       Text("Login with Google",style: TextStyle(
                //           color: Colors.black
                //       ),),
                //
                //     ],
                //   ),
                //
                // ),
                // ),
                // SizedBox(
                //   height: 40,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text("New to this logistics "),
                //     GestureDetector(
                //         onTap: (){
                //           Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()),);
                //         },
                //
                //         child: Text("Resgister here",style: TextStyle(
                //             color: Colors.blue
                //         ),))
                //   ],
                // ),
                // SizedBox(
                //   height: 40,
                // ),

              ],

            ),


          ),
        ),
      ),
    );
  }

  bool _phoneNumberValidator(String value) {
    const pattern =
        r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }


}
