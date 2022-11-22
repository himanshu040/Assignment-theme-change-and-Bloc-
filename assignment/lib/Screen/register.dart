import 'package:assignment/themeprovider.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  String? countryValue="";
  String? stateValue="";
  String? cityValue="";
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _phone = TextEditingController();
    TextEditingController _password = TextEditingController();
    TextEditingController _confirmpassword = TextEditingController();
    TextEditingController _roleid = TextEditingController();


    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    return Scaffold(
       body: SingleChildScrollView(
         child: Container(
           padding: EdgeInsets.symmetric(horizontal: 40),
           width: MediaQuery.of(context).size.width,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               SizedBox(
                 height: 50,
               ),
               Consumer<Themeprovider>(
                   builder: (context,theme,snapshot)=>GestureDetector(
                       onTap: ()=>Navigator.pop(context),
                       child: Icon(Icons.arrow_back,color: theme.isdarktheme?Colors.white:Colors.black,))
               ),
               SingleChildScrollView(
                 child: Form(
                   key: _formkey,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [

                       Align(
                           alignment: Alignment.topCenter,
                           child: Image.asset("images/signupScreen.png")),
                       SizedBox(
                         height: 30,
                       ),
                       Text("Register",style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold
                       ),),
                       SizedBox(
                         height: 50,
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                         child: TextFormField(
                           controller: _name,
                           keyboardType: TextInputType.text,
                           decoration: buildInputDecoration(Icons.person,"Full Name"),
                           validator: (String? value){
                             if(value!.isEmpty)
                             {
                               return "Please enter name";
                             }
                             return null;
                           },
                           onSaved: (String? name){

                           },

                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                         child: TextFormField(
                           controller: _email,
                           keyboardType: TextInputType.text,
                           decoration:buildInputDecoration(Icons.email,"Email"),
                           validator: (String? value){
                             if(value!.isEmpty)
                             {
                               return "Please enter  email";
                             }
                             if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
                             {
                               return "Please enter valid email";
                             }
                             return null;
                           },
                           onSaved: (String? email){

                           },

                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                         child: TextFormField(
                           controller: _phone,
                           maxLength: 10,
                           keyboardType: TextInputType.number,
                           decoration:buildInputDecoration(Icons.phone,"Phone No"),
                           validator: (String? value){
                             if(value!.isEmpty)
                             {
                               return "Please enter  phone";
                             }
                             if(value.length !=10 &&  !RegExp("^[0-9]").hasMatch(value))
                             {
                               return "Please enter valid phone";
                             }
                             return null;
                           },
                           onSaved: (String? phone){

                           },
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                         child: TextFormField(
                           controller: _password,
                           keyboardType: TextInputType.text,
                           decoration:buildInputDecoration(Icons.lock,"Password"),
                           validator: (String? value){
                             if(value!.isEmpty)
                             {
                               return "Please enter password";
                             }

                             return null;
                           },

                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                         child: TextFormField(
                           controller: _confirmpassword,
                           obscureText: true,
                           keyboardType: TextInputType.text,
                           decoration:buildInputDecoration(Icons.lock,"Confirm Password"),
                           validator: (String? value){
                             if(value!.isEmpty)
                             {
                               return "Please enter re-password";
                             }
                             if(_password.text != _confirmpassword.text)
                             {
                               return "Password Do not match";
                             }
                             return null;
                           },


                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                         child: TextFormField(
                           controller: _roleid,
                           obscureText: true,
                           keyboardType: TextInputType.number,
                           decoration:buildInputDecoration(Icons.featured_video_outlined,"Role Id"),
                           validator: (String? value){
                             if(value!.isEmpty)
                             {
                               return "Please enter roleid";
                             }
                             if(int.parse(_roleid.text)>40)
                               return "Please enter valid roleid between 0 to 40";

                             return null;
                           },


                         ),
                       ),

                       SelectState(
                         // style: TextStyle(color: Colors.red),
                         onCountryChanged: (value) {
                           setState(() {
                             countryValue = value;
                           });
                         },
                         onStateChanged:(value) {
                           setState(() {
                             stateValue = value;
                           });
                         },
                         onCityChanged:(value) {
                           setState(() {
                             cityValue = value;
                           });
                         },

                       ),
                       SizedBox(
                         height: 10,
                       ),

                       SizedBox(
                         width: 200,
                         height: 50,
                         child: RaisedButton(
                           color: Colors.redAccent,
                           onPressed: (){

                             if(_formkey.currentState!.validate())
                             {
                               // RegistrationUser();
                               print("Successful");
                             }else
                             {

                               print("Unsuccessfull");
                             }

                           },
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(50.0),
                               side: BorderSide(color: Colors.blue,width: 2)
                           ),
                           textColor:Colors.white,child: Text("Submit"),

                         ),
                       ),
                       SizedBox(
                         height: 50,
                       ),
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
    );
  }

  buildInputDecoration(IconData lock, String s) {
 return InputDecoration(
     hintText: s,
     icon:Icon(lock)
 );
  }
}
