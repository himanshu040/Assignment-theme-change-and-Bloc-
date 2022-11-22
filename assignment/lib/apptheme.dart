import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants/colors.dart';

class Apptheme{
  static final ThemeData light= ThemeData(
      buttonColor:Light.primary,
      brightness:Brightness.light,
      backgroundColor:Light.background,
      cardColor:Light.card,
      disabledColor:Light.disabledbutton,
      errorColor:Light.error,
      hintColor:Light.fontsubtitle,
      indicatorColor:Light.primary,
      primaryIconTheme:IconThemeData(
        color:Light.fonttitle,
      ),
      primaryColor: Light.primary,
      textSelectionTheme:TextSelectionThemeData(
          cursorColor: Light.primary
      ),
      scaffoldBackgroundColor:Light.background,
      appBarTheme:AppBarTheme(
          elevation:0.0,
          centerTitle: true
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        headline1: GoogleFonts.poppins(
            color: Light.fonttitle,
            fontSize: 20.0,
            fontWeight: FontWeight.w500
        ),
        headline2: GoogleFonts.poppins(
            color: Light.fonttitle,
            fontSize: 18.0,
            fontWeight: FontWeight.w500
        ),
        headline3: GoogleFonts.poppins(
            color: Light.fonttitle,
            fontSize: 16.0,
            fontWeight: FontWeight.w500
        ),
        headline4: GoogleFonts.poppins(
            color: Light.fonttitle,
            fontSize: 14.0,
            fontWeight: FontWeight.w500
        ),
        headline5: GoogleFonts.poppins(
            color: Light.fonttitle,
            fontSize: 12.0,
            fontWeight: FontWeight.w500
        ),
        bodyText1: GoogleFonts.poppins(
            color: Light.fonttitle,
            fontSize: 16.0,
            fontWeight: FontWeight.normal
        ),
        bodyText2: GoogleFonts.poppins(
            color: Light.fonttitle,
            fontSize: 12.0,
            fontWeight: FontWeight.normal
        ),
        subtitle2: GoogleFonts.poppins(
            color: Light.fontsubtitle,
            fontSize: 12.0,
            fontWeight: FontWeight.normal
        ),
        subtitle1: GoogleFonts.poppins(
            color: Light.fontsubtitle,
            fontSize: 14.0,
            fontWeight: FontWeight.normal
        ),
      )

  );
  static final ThemeData darktheme=ThemeData(
      buttonColor:dark.primary,
      brightness:Brightness.light,
      backgroundColor:dark.background,
      cardColor:dark.card,
      disabledColor:dark.disabledbutton,
      errorColor:dark.error,
      hintColor:dark.fontsubtitle,
      indicatorColor:dark.primary,
      primaryIconTheme:IconThemeData(
        color:dark.fonttitle,
      ),
      primaryColor: dark.primary,
      textSelectionTheme:TextSelectionThemeData(
          cursorColor: dark.primary
      ),
      scaffoldBackgroundColor:dark.background,
      appBarTheme:AppBarTheme(
          elevation:0.0,
          centerTitle: true,
        backgroundColor: Colors.red
      ),
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        headline1: GoogleFonts.poppins(
            color: dark.fonttitle,
            fontSize: 20.0,
            fontWeight: FontWeight.w500
        ),
        headline2: GoogleFonts.poppins(
            color: dark.fonttitle,
            fontSize: 18.0,
            fontWeight: FontWeight.w500
        ),
        headline3: GoogleFonts.poppins(
            color: dark.fonttitle,
            fontSize: 16.0,
            fontWeight: FontWeight.w500
        ),
        headline4: GoogleFonts.poppins(
            color: dark.fonttitle,
            fontSize: 14.0,
            fontWeight: FontWeight.w500
        ),
        headline5: GoogleFonts.poppins(
            color: dark.fonttitle,
            fontSize: 12.0,
            fontWeight: FontWeight.w500
        ),
        bodyText1: GoogleFonts.poppins(
            color: dark.fonttitle,
            fontSize: 16.0,
            fontWeight: FontWeight.normal
        ),
        bodyText2: GoogleFonts.poppins(
            color: dark.fonttitle,
            fontSize: 12.0,
            fontWeight: FontWeight.normal
        ),
        subtitle2: GoogleFonts.poppins(
            color: dark.fontsubtitle,
            fontSize: 12.0,
            fontWeight: FontWeight.normal
        ),
        subtitle1: GoogleFonts.poppins(
            color: dark.fontsubtitle,
            fontSize: 14.0,
            fontWeight: FontWeight.normal
        ),
      )
  );

}