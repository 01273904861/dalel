import 'package:bloc/bloc.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthIntialState());

  TextEditingController signUpEmailContoller = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpFirstNameController = TextEditingController();
  TextEditingController signUpLastNameController = TextEditingController();

  final GlobalKey<FormState> signUpFormKey = GlobalKey();
  bool termsAndConditionValue = false;
  void signUp() async {
    try {
      emit(SignUpLoadingState());
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpEmailContoller.text,
        password: signUpPasswordController.text,
      );
      verifyUser();
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

  void termsAndConditionChanges() {
    emit(TermsAndConditionChangedState());
  }
}

//abdelrahman982004@gmail.com