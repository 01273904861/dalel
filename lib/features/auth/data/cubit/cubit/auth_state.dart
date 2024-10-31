
abstract class AuthState {}

class AuthIntialState extends AuthState {}

class SignUpLoadingState extends AuthState {}

class SignUpSuccessState extends AuthState {}

class SignUpFailureState extends AuthState {
  final String errorMessage;

  SignUpFailureState({required this.errorMessage});
}


class VerifyEmailLoadingState extends AuthState{}
class VerifyEmailSucessState extends AuthState{}
class VerifyEmailFailureState extends AuthState{
final String errorMessage;

  VerifyEmailFailureState({required this.errorMessage});
}
class TermsAndConditionChangedState extends AuthState {}

