import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/const.dart';

class Themeprovider with ChangeNotifier{
   var _pref;
  bool _isdarktheme=false;
  bool get isdarktheme=> _isdarktheme;
  Themeprovider(){
    _isdarktheme=false;
    _loadfromPrefs();
  }
  void changetheme(){
    _isdarktheme=!_isdarktheme;
    _savetopref();
    notifyListeners();
  }
  _loadfromPrefs() async{
    await _initPrefs();
    _isdarktheme=_pref.getBool(theme)??false;
    notifyListeners();
  }
  _savetopref()
  async {
    await _initPrefs();
    _pref.setBool(theme, _isdarktheme);
  }

  _initPrefs() async{
    if(_pref==null)
      {
        _pref=await SharedPreferences.getInstance();
      }
  }
}
