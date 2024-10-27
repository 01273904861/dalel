import 'package:dalel/core/routing/app_router.dart';
import 'package:dalel/core/routing/routes.dart';
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
        initialRoute: Routes.onBoarding,
      ),
    );
  }
}
