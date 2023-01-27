import 'package:flutter/material.dart';
import 'package:hacknitr_round2/routes/route_path.dart';

abstract class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget currentWidget;

    switch (settings.name) {
      case RoutePath.routeInitial:
      case RoutePath.routeToSplashScreen:
        // currentWidget = const SplashScreen();
        // Change with screen
        currentWidget = Container();
        break;

      default:
        currentWidget = Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
    }
    return _AppRoute(screen: currentWidget, settings: settings);
  }

  static void goToEventScreen(BuildContext context) {}
}

class _AppRoute extends PageRouteBuilder {
  final Widget screen;
  // ignore: annotate_overrides
  final RouteSettings settings;

  _AppRoute({required this.screen, required this.settings})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              screen,
          settings: settings,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
