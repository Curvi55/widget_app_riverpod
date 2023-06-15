
import 'package:go_router/go_router.dart';

// NOTESE LA IMPORTACIÓN DEL ARCHIVO BARRIL CON TODAS LAS SCREENS
import '../../presentation/screens/screens.dart';


// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',  //pagina default donde se abre
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen(),
    ),

    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen(),
    ),

    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen(),
    ),

    GoRoute(
      path: '/snackbars',
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen(),
    ),

    GoRoute(
      path: '/animated',
      name: AnimatedScreens.name,
      builder: (context, state) => const AnimatedScreens(),
    ),

    GoRoute(
      path: '/ui-controls',
      name: UiControlsScreen.name,
      builder: (context, state) => const UiControlsScreen(),
    ),

    GoRoute(
      path: '/tutorial',
      name: AppTutorialScreens.name,
      builder: (context, state) => const AppTutorialScreens(),
    ),


    GoRoute(
      path: '/infinite',
      name: InfiteScrollScreen.name,
      builder: (context, state) => const InfiteScrollScreen(),
    ),

    GoRoute(
      path: '/river',
      name: CounterScreen.name,
      builder: (context, state) => const CounterScreen(),
    ),


  ],
);