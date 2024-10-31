part of 'forgot_password_cubit.dart';

class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordSucessState extends ResetPasswordState {}

class ResetPasswordLodingState extends ResetPasswordState {}

class ResetPasswordFailureState extends ResetPasswordState {
  final String errorMessage;

  ResetPasswordFailureState({required this.errorMessage});
}
