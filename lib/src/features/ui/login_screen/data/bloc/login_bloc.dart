import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../shared_pref/shared_pref.dart';
import '../repo/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RepoLogin repo;
  LoginBloc({
    required this.repo
}) : super(LoginInitial()) {
    on<LoginUserEvent>(_onLogin);
  }
  _onLogin(LoginUserEvent event,Emitter<LoginState> emit) async{
    emit(LoginLoadingState());
    try{
      final response = await repo.login(event.username, event.password);

      emit(LoginSuccess());
    } catch(e){
      print('$e');
      emit(LoginErrorState(errorMessage:'${e}'));
    }
  }
}
