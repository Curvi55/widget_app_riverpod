import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
/* ya despuesd de definir las rutas en app_router.dart no se necesita importarlas 1 a 1

import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/presentation/screens/home/home_screen.dart';
*/

// IMPORANTE AL EMPEZAR EL PROYECTO
// CORRER  en la terminal para inicializar el proyecto en el repositorio
/*
1. git init
2. git add .
3. git commit -m "first commit"
*/
// o desde el vs con view control source ctrl+shift +G
/* no es recomendable trabajar en la rama main, pero para saber donde estoy
poner en la terminal el command "git status"
en este caso nos vamos a mover a otra rama llamada 01-bases
para ello en la terminal escribimos el command "git checkout -b 01-bases"
al terminar todo unimos la rama 01-bases a la rama main (production) que es la final siempre.
si algo se daño y queremos volver a la ultima version de commit estable
usar el comando git checkout -- .
*/

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // notese que se le agrega router al MaterialApp
    return MaterialApp.router(
      routerConfig: appRouter, // se connecta ahora con el router definido en app_router.dart
      debugShowCheckedModeBanner: false,
      theme:AppTheme(selectedColor: 9).getTheme(),
      /*
      home: const HomeScreen(),
        FLUTTER recomienda utilizar go_router en vez de este tipo de routing
      routes: {
        '/buttons': (context) => const ButtonsScreen(),
        '/cards':(context) => const CardsScreen()
      } */


      );
  }
}
