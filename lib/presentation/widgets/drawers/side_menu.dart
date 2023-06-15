import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

// ctrl + .  sobre la palabra StateLessWidget para convertir a Statefulwidget
class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key,
    required this.scaffoldKey
    
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  //propiedad
  int navDrawerIndex = 0; //para saber cual opcion del menu del drawer está seleccionada

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 25;
    //print('hasNotch =   ${MediaQuery.of(context).viewPadding.top}');

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final item = appMenuItems[value];
        context.push(item.link);
        //notese el uso de la palabra reservada widget para poder accesar la variable global de estado del scaffold
        //para solucionar el error the method closeDrawer cant be unconditional invoke  .. can be null, se pone un ?  o ! despues de currentState
        widget.scaffoldKey.currentState!.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Selecciona'),
        ),

        ...appMenuItems
            .sublist(0, 3) // solo para que salgan los primero 3 items
            .map(
              (items) => NavigationDrawerDestination(
                //notese la referencia al items, que se convierte en el objeto individual del map
                icon: Icon(items.icon),
                label: Text(items.title),
              ),
            ),
        //ubiquemos una barrita divisoria para que no sea el menu muy serio
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text('More Options'),
        ),

        ...appMenuItems
            .sublist(3) // solo para que salgan los primero 3 items
            .map(
              (items) => NavigationDrawerDestination(
                //notese la referencia al items, que se convierte en el objeto individual del map
                icon: Icon(items.icon),
                label: Text(items.title),
              ),
            ),
      ],
    );
  }
}
