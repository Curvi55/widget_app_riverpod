import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedColor = ref.watch(selectedColorProvider);
    //final myModeStatus  = ref.watch(isDarkMode);
    //reemplazamos la linea de arriba para ahora utilizar el themeNotifierProvider
    final myModeStatus = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Theme Changer'),
          actions: [
            IconButton(
              //icon: const Icon(Icons.light_mode_outlined),
              icon: (myModeStatus
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined)),
              onPressed: () {
                // reemplazamos esta linea de abajo para ahora utilizar el themeNotifierProvider
                // ref.read(isDarkMode.notifier).state = !ref.read(isDarkMode.notifier).state;

                ref
                    .read(themeNotifierProvider.notifier)
                    .togleDarkMode(); // importante en notifierProvider uno maneja la clase control para el objeto por eso puede accesar su metodo toggleColor
              },
            ),
          ],
        ),
        body: const _ThemeChangerView());
  }
}

// para hacer referencia al ref se cambia de StateLessWidget a ConsumerWidget y se cambia el parametro
class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    //final int mySelectedColor = ref.watch(selectedColorProvider);
    // notese el uso de watch para actualizar los cambios.
    final List<Color> colors = ref.watch(colorListProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    //final int mySelectedColor = ref.watch(themeNotifierProvider).selectedColor;
    final int mySelectedColor = appTheme.selectedColor;

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final Color color = colors[index];

          return RadioListTile(
              title: Text("Este color :", style: TextStyle(color: color)),
              subtitle: Text('${color.value}'),
              activeColor: color,
              value: index,
              groupValue: mySelectedColor,
              onChanged: (value) {
                //  notificar el cambio del value a algun lugar
                // estamos reemplazando la linea de ahora para utilizar ahora el themeAppProvider
                //ref.read(selectedColorProvider.notifier).state = index;

                ref
                    .read(themeNotifierProvider.notifier)
                    .changeColorIndex(index);
              });
        });
  }
}
