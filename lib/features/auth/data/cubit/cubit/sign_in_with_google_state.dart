part of 'sign_in_with_google_cubit.dart';

class SignInWithGoogleState {}

final class SignInWithGoogleInitial extends SignInWithGoogleState {}

final class SignInWithGoogleLoadingState extends SignInWithGoogleState {}

final class SignInWithGoogleFailureState extends SignInWithGoogleState {
  final String errorMessage;
  SignInWithGoogleFailureState({required this.errorMessage});
}

final class SignInWithGoogleSuccessState extends SignInWithGoogleState {}




final class SignOutWithGoogleFailureState extends SignInWithGoogleState {
  final String errorMessage;
  SignOutWithGoogleFailureState({required this.errorMessage});
}

final class SignOutWithGoogleSuccessState extends SignInWithGoogleState {}
