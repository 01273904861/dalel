import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/features/auth/ui/views/login_view.dart';
import 'package:dalel/features/auth/ui/views/register_view.dart';
import 'package:dalel/features/home/home_view.dart';
import 'package:dalel/features/onboarding/on_boarding_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (context) {
          return const HomeView();
        });
      case Routes.logIn:
        return MaterialPageRoute(builder: (context) {
          return const LoginView();
        });
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) {
          return const OnBoardingView();
        });
      case Routes.register:
        return MaterialPageRoute(builder: (context) {
          return const RegisterView();
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Text('the route of ${settings.name} does\'t exist'),
          );
        });
    }
  }
}
