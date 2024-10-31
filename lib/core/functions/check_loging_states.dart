
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

void checkLogingStates() {
  FirebaseAuth.instance.authStateChanges().listen((User? user ){
    if(user == null){
      log('user signed out');
    }
    else {
      log('user signed in');
    }
  });
}


