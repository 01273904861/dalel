import 'package:dalel/core/database/cache_constants.dart';
import 'package:dalel/core/database/cache_helper.dart';
import 'package:dalel/core/routing/app_router.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DalelApp extends StatelessWidget {
  const DalelApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(812, 375),
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.onGenerateRoute,
            initialRoute:getInitialRouteMethod()),
      ),
    );
  }
}

String getInitialRouteMethod() {
  if (CacheHelper().getData(key: CacheConstants.visitedOnBoarding)) {
    if (FirebaseAuth.instance.currentUser == null ||
        !FirebaseAuth.instance.currentUser!.emailVerified) {
      return Routes.logIn;
    } else {
      return Routes.homePage;
    }
  } else {
    return Routes.onBoarding;
  }
  // return CacheHelper().getData(key: CacheConstants.visitedOnBoarding)
  //     ? FirebaseAuth.instance.currentUser == null
  //         ? Routes.logIn
  //         : FirebaseAuth.instance.currentUser!.emailVerified
  //             ? Routes.homePage
  //             : Routes.logIn
  //     : Routes.onBoarding;
}
