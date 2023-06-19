import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';
  
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selectedColor = ref.watch(selectedColorProvider);
    final myModeStatus  = ref.watch(isDarkMode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
            IconButton(
            //icon: const Icon(Icons.light_mode_outlined),
              icon: (myModeStatus?  const Icon(Icons.dark_mode_outlined): const Icon(Icons.light_mode_outlined)),
              color: Colors.black,
              highlightColor: Colors.grey,
              onPressed: (){
                ref.read(isDarkMode.notifier).state = !ref.read(isDarkMode.notifier).state;
              }, 
            ),                      
        ],        
      ),
     body:const _ThemeChangerView()
      
    );
  }
}

// para hacer referencia al ref se cambia de StateLessWidget a ConsumerWidget y se cambia el parametro
class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context,ref) {

    final int mySelectedColor = ref.watch(selectedColorProvider);
    final List<Color> colors = ref.watch(colorListProvider);
    return ListView.builder(
        itemCount: colors.length,

        itemBuilder: (context,index){
          final Color color = colors[index];

          return RadioListTile(
            title:Text("Este color :", style: TextStyle(color:color)),
            subtitle: Text('${color.value}'),
            
            activeColor: color,
            value: index,            
            groupValue: mySelectedColor,
            onChanged: (value) {
                //  notificar el cambio del value a algun lugar
                
                ref.read(selectedColorProvider.notifier).state = index;                
                
            } ); 
        }
      );
  }
}
