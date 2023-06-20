import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/drawers/side_menu.dart';

class HomeScreen extends StatelessWidget {
  // esta propiedad name es para trabajar con go_router, es static porque no
  // se quiere crear una instancia de esta clase solo para saber el nombre
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //creacion del key para referencia
    final scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      //referencia key para usar en side_menu
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
        centerTitle: false,
      ),
      body: const _HomeView(),
      drawer: SideMenu(
        scaffoldKey: scaffoldKey,
      ), //para mostrar el menu lateral izquierdo
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();
  
  @override
  Widget build(BuildContext context) {
    appMenuItems; // definida en menu_items.dart

    return ListView.builder(
        //physics:const BouncingScrollPhysics(),

        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          MenuItem menuItem = appMenuItems[index];
          return _CustomListTile(menuItem: menuItem);
        });
  }
}

class _CustomListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _CustomListTile({
    required this.menuItem,
  });

// en esta seccion se agrego un nuevo SETUP para crear codigo automaticos (macro)
// cart + shift + P ; user snipper / dart
// uso escribir themes.of y completa el codigo

  @override
  Widget build(BuildContext context) {
    // con la config de arriba se typea theme-of y se selcciona del menu y completa el codigo
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      tileColor: Colors.white,
      textColor: colors.primary,
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      // evento de cuando se toca
      onTap: () {
        //navigation and routing , ver la documentación adjunta del curso
        //https://docs.flutter.dev/ui/navigation

        /* Navigator.of(context).push(
          
            MaterialPageRoute(
                builder: (context) => const ButtonsScreen()
             ),
          ); */
        // forma alternativa para hacer la navegacion, aunque la oficial recomendada go_router
        //Navigator.pushNamed(context, menuItem.link);
        // intead of go , usemos push, para poder devolvernos

        // como alternativa se puede usar el nombre en vez del path abajo el ejemplo
        //context.pushNamed(CardsScreen.name);
        context.push(menuItem.link); // estilo go_router
      },
    );
  }
}
