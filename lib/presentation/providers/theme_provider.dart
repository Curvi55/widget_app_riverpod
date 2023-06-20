// este es un provider para un boolean, se usará para controlar el tema
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';


//lista de colores inmutables // notese que se utiliza Provider en vez de StateProvider
final colorListProvider  = Provider((ref)=> colorList);

// un simple boolean
final isDarkMode = StateProvider((ref) =>false);

// color de tema
final selectedColorProvider = StateProvider((ref) => 0);

//  un objecto personalizado tipo AppTheme (custom) // mantiene el estado de un objeto más elavorado
// primer parametro para StateNotifierProvider es el controlador del estado ThemeNotifier, y el segundo la clase que se le va a dar status
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
           // se crea la instancia ThemeNotifier
  (ref) => ThemeNotifier(),  // se pueden mandar parametros si se desea.
  );

// controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  // STATE = estado de una nueva instancia Apptheme
  // nota: aquí se controla el estado del AppTheme
  ThemeNotifier():super(AppTheme());

  void togleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }

}
