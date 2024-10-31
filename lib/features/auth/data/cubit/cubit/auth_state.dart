abstract class AuthState {}

class AuthIntialState extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFailureState extends AuthState {
  final String errorMessage;

  SignUpFailureState({required this.errorMessage});
}



class TermsAndConditionChangedState extends AuthState {}

