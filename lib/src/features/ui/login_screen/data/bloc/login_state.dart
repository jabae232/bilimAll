part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState{}
class LoginErrorState extends LoginState{
  final String errorMessage;
  LoginErrorState({
    required this.errorMessage,
});
}
class LoginSuccess extends LoginState{
}