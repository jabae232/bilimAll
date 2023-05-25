import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

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
    print(event.username);
    print(event.password);
    emit(LoginLoadingState());
    late final response;
    try{
      response = repo.login(event.username, event.password);
      emit(LoginSuccess());
    } catch(e){
      emit(LoginErrorState(errorMessage:'${e}'));
    }
  }
}
