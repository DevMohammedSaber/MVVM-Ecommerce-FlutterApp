part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthRegisterLoadingState extends AuthState {}

final class AuthRegisterFaliureState extends AuthState {
  String message;
  AuthRegisterFaliureState({required this.message});
}

final class AuthRegisterSuccessState extends AuthState {}

/////////////////////////////////////////////////////////

final class AuthLoginLoadingState extends AuthState {}

final class AuthLoginFaliureState extends AuthState {
  String message;
  AuthLoginFaliureState({required this.message});
}

final class AuthLoginSuccessState extends AuthState {}
