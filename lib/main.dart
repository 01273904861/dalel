import 'package:dalel/core/functions/check_loging_states.dart';
import 'package:dalel/core/database/cache_helper.dart';
import 'package:dalel/core/routing/app_router.dart';
import 'package:dalel/features/dalel_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  checkLogingStates();

  runApp(DalelApp(
    appRouter: AppRouter(),
  ));
}
