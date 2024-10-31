part of 'reset_password_cubit.dart';

class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordSucessState extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState {}

class ResetPasswordFailureState extends ResetPasswordState {
  final String errorMessage;

  ResetPasswordFailureState({required this.errorMessage});
}
