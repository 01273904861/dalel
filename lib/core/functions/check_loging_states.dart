
import 'package:firebase_auth/firebase_auth.dart';

void checkLogingStates() {
  FirebaseAuth.instance.authStateChanges().listen((User? user ){
    if(user == null){
      print('user signed out');
    }
    else {
      print('user signed in');
    }
  });
}


