import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {

  static const name = 'counter_screen';
  final int initialCount=0;
   
  const CounterScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),        
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
            Text('$initialCount',
            style: Theme.of(context).textTheme.titleLarge),
            FloatingActionButton(
              heroTag: null,
              child:const Icon(Icons.add),
              onPressed: (){
                //initialCount++;  
              }),
          ],
         )
         


      ),
    );
  }
}


