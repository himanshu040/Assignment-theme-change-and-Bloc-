import 'package:assignment/Screen/animation.dart';
import 'package:assignment/Screen/login.dart';
import 'package:assignment/apptheme.dart';
import 'package:assignment/localeString.dart';
import 'package:assignment/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'Screen/Splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>Themeprovider(),
    child: Consumer<Themeprovider>(
      builder: (context,theme,snapshot){
        return  GetMaterialApp(
              title: 'Flutter Assignment',
              translations: LocalString(),
              locale:  Locale('en','US'),
              theme: Apptheme.light,
              darkTheme: Apptheme.darktheme,
              themeMode: theme.isdarktheme?ThemeMode.dark:ThemeMode.light,
              home: Splash(),
            );
      },
    ),);



    //   MaterialApp(
    //   title: 'Flutter Assignment',
    //   theme: Apptheme.light,
    //   home: Splash(),
    // );
  }
}

