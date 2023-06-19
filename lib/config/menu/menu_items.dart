// notese el uso de show, esto es para especiaf exactamente lo que se necesita y no mas
import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;


    
   const MenuItem({

      required this.title,
      required this.subTitle,
      required this.link,
      required this.icon
    });
}
    List<MenuItem> appMenuItems = [


  const MenuItem(
      title: 'Theme Changer',
      subTitle: 'Theme Changer Riverpod',
      link: '/theme_changer_screen',
      icon: Icons.color_lens_outlined), 

    const MenuItem(
      title: 'Counter Screen RP',
      subTitle: 'Riverpod',
      link: '/river',
      icon: Icons.add), 


     const MenuItem(
        title:'Botones' ,
        subTitle: 'Varios botones en flutter',
        link:'/buttons'  ,
        icon:Icons.smart_button_outlined 
        ),

      const MenuItem(
        title:'Tarjetas' ,
        subTitle: 'Contenedor estilizado',
        link:'/cards'  ,
        icon:Icons.credit_card
        ),

      const MenuItem(
        title:'Progress Indicators' ,
        subTitle: 'Generales y controlados',
        link:'/progress'  ,
        icon:Icons.refresh_rounded
        ),
        
      const MenuItem(
        title:'Snackbars' ,
        subTitle: 'Snackbars y Dialogos',
        link:'/snackbars'  ,
        icon:Icons.info_outlined
        ),
      const MenuItem(
        title:'Animated Container' ,
        subTitle: 'Statefull widget animado',
        link:'/animated'  ,
        icon:Icons.check_box_outline_blank_outlined
        ), 
      const MenuItem(
        title:'UI controls & tiles' ,
        subTitle: 'Una serie de controles de Flutter',
        link:'/ui-controls'  ,
        icon:Icons.control_point_sharp
        ), 
      const MenuItem(
        title:'App Tutorial' ,
        subTitle: 'Introducción a la app',
        link:'/tutorial'  ,
        icon:Icons.system_security_update_good_sharp
        ), 
      const MenuItem(
        title:'Infinite scroll and Pull' ,
        subTitle: 'Listas infinitas y pull to refresh',
        link:'/infinite'  ,
        icon:Icons.list_alt_rounded
        ), 

    ];

