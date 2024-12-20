import 'dart:developer';

import 'package:dalel/core/database/cache_constants.dart';
import 'package:dalel/core/database/cache_helper.dart';
import 'package:dalel/core/routing/app_router.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DalelApp extends StatelessWidget {
  const DalelApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.onGenerateRoute,
          initialRoute: getInitialRouteMethod()),
    );
  }
}

String getInitialRouteMethod() {
  if (CacheHelper().getData(key: CacheConstants.visitedOnBoarding) == true) {
      log(CacheHelper().getData(key: CacheConstants.visitedOnBoarding).toString());
    if (FirebaseAuth.instance.currentUser == null ||
        !FirebaseAuth.instance.currentUser!.emailVerified) {
      return Routes.logIn;
    } else {
      return Routes.homeNavBarWidget;
    }
  } else {
     log(CacheHelper().getData(key: CacheConstants.visitedOnBoarding).toString());
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
