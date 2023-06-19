import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_providers.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


// notese que para usar Riverpod cambiamos el widget base StatelessWidget or StateFullWidget a ConsumerWidget (que es de riverpod)
class CounterScreen extends ConsumerWidget {

  static const name = 'counter_screen';
     
  const CounterScreen({Key? key}) : super(key: key);

  
  @override
  // para que este build funcione con Riverpod agregamos WidgetRef al parametro del build
  Widget build(BuildContext context, WidgetRef ref) {
    final int initialCount = ref.watch(counterProvider);
    final myModeStatus  = ref.watch(isDarkMode);

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        // para poner icons, etc
        actions: [
          IconButton(
            //icon: const Icon(Icons.light_mode_outlined),
            icon: (myModeStatus?  const Icon(Icons.dark_mode_outlined): const Icon(Icons.light_mode_outlined)),
            onPressed: (){
              ref.read(isDarkMode.notifier).state = !ref.read(isDarkMode.notifier).state;
            }, 
              
            ),
        ],        
      ),
      floatingActionButton: FloatingActionButton(
          // se usa el child para asignarle un iconito
          // si no sale el preview del icon for some reason,  doble ctrl space (1 muestra menu) ctrl space (2 muestra el preview)
          heroTag: null,
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      body: Center(
         
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Screen',style: Theme.of(context).textTheme.titleLarge),
            Text('Conteo:',style: Theme.of(context).textTheme.titleLarge),
            Text('$initialCount',style: Theme.of(context).textTheme.titleLarge),
            FloatingActionButton(
              heroTag: null,
              child:const Icon(Icons.add),
              onPressed: (){
                // no se usa el watch pero el read , y el notifier,  el state tiene el valor para la operacion
                //ref.read(counterProvider.notifier).state++;
                //                  otra forma alternativa seria
                ref.read(counterProvider.notifier).update((state) => state+1);
              }),
          ],
         )
         


      ),
    );
  }
}


