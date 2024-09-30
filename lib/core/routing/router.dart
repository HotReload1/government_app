import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:government_project/core/routing/route_path.dart';
import 'package:government_project/layers/view/about/about.dart';
import 'package:government_project/layers/view/decisions/decision_screen.dart';
import 'package:government_project/layers/view/events/events_screen.dart';
import 'package:government_project/layers/view/home/home_screen.dart';
import 'package:government_project/layers/view/intro/spalsh_screen.dart';
import 'package:government_project/layers/view/report/report_screen.dart';
import 'package:government_project/layers/view/services/services_screen.dart';
import '../../layers/view/news/news_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutePaths.News:
        return MaterialPageRoute(builder: (_) => NewsScreen());
      case RoutePaths.DecisionScreen:
        return MaterialPageRoute(builder: (_) => const DecisionScreen());
      case RoutePaths.EventsScreen:
        return MaterialPageRoute(builder: (_) => const EventsScreen());
      case RoutePaths.ServicesScreen:
        return MaterialPageRoute(builder: (_) => const ServicesScreen());
      case RoutePaths.AboutScreen:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      case RoutePaths.ReportScreen:
        return MaterialPageRoute(builder: (_) => const ReportScreen());
      case RoutePaths.SplashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
                // child: Text('No route defined for ${settings.name}'),
                ),
          ),
        );
    }
  }
}
