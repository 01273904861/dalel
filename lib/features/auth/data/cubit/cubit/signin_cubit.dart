import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SignInState> {
  SigninCubit() : super(SigninInitial());

  TextEditingController signInEmailContoller = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey();
  void signIn() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInEmailContoller.text,
        password: signInPasswordController.text,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState(errorMessage: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState(
            errorMessage: 'Wrong password provided for that user'));
      } else {
        emit(SignInFailureState(errorMessage: 'check email and password'));
      }
    } catch (e) {
      emit(SignInFailureState(errorMessage: 'check email and password'));
    }
  }
}
