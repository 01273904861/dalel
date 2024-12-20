import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/data/cubit/cubit/reset_password_cubit.dart';
import 'package:dalel/features/auth/data/cubit/cubit/sign_in_cubit.dart';
import 'package:dalel/features/auth/data/cubit/cubit/sign_in_with_google_cubit.dart';
import 'package:dalel/features/auth/ui/views/reset_passowrd_view.dart';
import 'package:dalel/features/auth/ui/views/sign_in_view.dart';
import 'package:dalel/features/auth/ui/views/sign_up_view.dart';
import 'package:dalel/features/home/home_view.dart';
import 'package:dalel/features/home/ui/widgets/home_nav_bar.dart';
import 'package:dalel/features/onboarding/ui/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (context) {
          return const HomeView();
        });
          case Routes.homeNavBarWidget:
        return MaterialPageRoute(builder: (context) {
          return const HomeNavBarWidget();
        });
      case Routes.logIn:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignInCubit(),
              ),
              BlocProvider(
                create: (context) => SignInWithGoogleCubit(),
              ),
            ],
            child: const SignInView(),
          );
        });
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (context) {
          return const OnBoardingView();
        });
      case Routes.register:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignUpView(),
          );
        });
      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => ResetPasswordCubit(),
            child: const ResetPasswordView(),
          );
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
