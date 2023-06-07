import 'dart:async';

import 'package:bilim_all/src/features/ui/account_screen/data/dto/account_dto.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repo/account_repo.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final RepoAccount repo;
  AccountBloc({
    required this.repo
}) : super(AccountInitial()) {
    on<GetAccountEvent>(_onGetAccount);
  }
  _onGetAccount(GetAccountEvent event, Emitter<AccountState> emitter) async {
    emit(AccountLoadingState());
    print('loading');
    final account = await repo.fetch();
    emit(AccountLoadedState(account: account));
  }
}
