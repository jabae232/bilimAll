part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}
class AccountLoadingState extends AccountState {}
class AccountLoadedState extends AccountState {
  final AccountDto account;
  AccountLoadedState({
    required this.account
});
}
class AccountError extends AccountState {}
