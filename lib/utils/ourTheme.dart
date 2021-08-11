import 'package:flutter/material.dart';


class OurTheme {
  Color _purplecolor = Color.fromARGB(255, 213, 235, 220);
  Color _lightgrey_color = Color.fromARGB(200, 200, 200, 200);
  Color _darkgreycolor = Color.fromARGB(165, 165, 165, 165);



  ThemeData buildTheme(){
    return ThemeData(
        canvasColor: _purplecolor,
        primaryColor: _purplecolor,
        accentColor: _darkgreycolor,
        secondaryHeaderColor: _darkgreycolor,
        hintColor: _lightgrey_color,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23.0),
                borderSide:BorderSide(
                    color: _lightgrey_color
                )
            )
        )


    );
  }
}