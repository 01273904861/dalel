import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ResetPasswordState> {
  ForgotPasswordCubit() : super(ResetPasswordInitial());
  TextEditingController resetPasswordEmailContoller = TextEditingController();
  //resetPasswordFormKey

  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey();
  Future<void> resetPassword() async {
    try {
      emit(ResetPasswordLodingState());
      FirebaseAuth.instance.setLanguageCode('en');
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetPasswordEmailContoller.text);
      emit(ResetPasswordSucessState());
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordFailureState(errorMessage: e.toString()));
    } catch (e) {
      emit(ResetPasswordFailureState(errorMessage: e.toString()));
    }
  }
}
