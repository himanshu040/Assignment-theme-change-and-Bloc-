import 'package:get/get.dart';

class LocalString extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'en_US':{
      'login':"Login",
      'password':"Password",
      'email':"Email id",
      'forgot':"Forgot Password?",
      'or':"OR",
      'logwg':"Login with Google",
      'new':"New to this logistics",
      'resgister':"Register here"
    },
    'hi_IN':{
      'login':"लॉग इन करें",
      'password':"पासवर्ड",
      'email':"ईमेल आईडी",
      'forgot':"पासवर्ड भूल गए?",
      'or':" या",
      'logwg':"गूगल के साथ लॉगिन करें",
      'new':"इस रसद के लिए नया",
      'resgister':"यहां रजिस्टर करें"
    }
  };

}