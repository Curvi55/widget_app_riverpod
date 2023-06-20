import 'package:flutter/material.dart';

   const List<Color> colorList =   [
      Colors.blue,
      Colors.teal,
      Colors.green,
      Colors.red,
      Colors.purple,
      Colors.deepPurple,
      Colors.orange,
      Colors.pink,
      Colors.pinkAccent,
      Colors.green
    ];

class AppTheme {

      final int selectedColor;
      final bool isDarkMode;

      AppTheme({
        this.isDarkMode = false,
        this.selectedColor = 0
      }) : assert (selectedColor >=0,'Selected color must be >=0' ),
           assert (selectedColor < colorList.length,'Selected color must be < ${colorList.length-1}' );

      ThemeData getTheme()=>ThemeData(
        useMaterial3: true,
        brightness: isDarkMode?Brightness.dark:Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        //configuracion general de todos los appbars en la app
        appBarTheme: const AppBarTheme(
          centerTitle: false
        )
      );

     //  nos permite tener una copia de la instancia // para poder modificar las declaraciones finales
     // el copywith es un standard que se usa en flutter para copiar la instancia de la clasess y extenderlas
      AppTheme copyWith({
        // parametros de copyWith
        int? selectedColor,
        bool? isDarkMode
      })=>AppTheme(
        //implementacion
        // si recibe el parametro lo establece y si no usa el default  this.selectedColor o  this.isDarkMode
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode
        
      );
}

