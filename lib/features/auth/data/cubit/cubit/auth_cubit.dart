import 'package:bloc/bloc.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthIntialState());

  TextEditingController signUpEmailContoller = TextEditingController();
  TextEditingController signInEmailContoller = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signInPasswordController = TextEditingController();
  TextEditingController signUpfirstNameController = TextEditingController();
  TextEditingController signUpLastNameController = TextEditingController();

  final GlobalKey<FormState> signInFormKey = GlobalKey();
  final GlobalKey<FormState> signUpFormKey = GlobalKey();
  bool termsAndConditionValue = false;
  void signUp() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpEmailContoller.text,
        password: signUpPasswordController.text,
      );
      //  verifyUser();
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailureState(
            errorMessage: 'The password provided is too weak'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailureState(
            errorMessage: 'The account already exists for that email.'));
      } else {
        emit(SignUpFailureState(errorMessage: 'check email and password'));
      }
    } catch (e) {
      emit(SignUpFailureState(errorMessage: 'check email and password'));
    }
  }

  Future<void> verifyUser() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

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

  void termsAndConditionChanges() {
    emit(TermsAndConditionChangedState());
  }


}

//abdelrahman982004@gmail.com