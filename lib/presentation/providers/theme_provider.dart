// este es un provider para un boolean, se usará para controlar el tema
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';


//lista de colores inmutables // notese que se utiliza Provider en vez de StateProvider
final colorListProvider  = Provider((ref)=> colorList);

// un simple boolean
final isDarkMode = StateProvider((ref) =>false);

// color de tema
final selectedColorProvider = StateProvider((ref) => 0);
