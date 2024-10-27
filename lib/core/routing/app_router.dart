import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/features/auth/ui/views/sign_in_view.dart';
import 'package:dalel/features/auth/ui/views/sign_up_view.dart';
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
          return const SignInView();
        });
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) {
          return const OnBoardingView();
        });
      case Routes.register:
        return MaterialPageRoute(builder: (context) {
          return const SignUpView();
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
