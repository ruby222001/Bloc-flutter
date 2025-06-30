import 'package:bloc_prac/grocery/login/bloc/login_event.dart'; // <-- add this
import 'package:bloc_prac/grocery/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        await Future.delayed(const Duration(seconds: 2));
        if (event.email == 'test@example.com' && event.password == 'password') {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure('Invalid credentials'));
        }
      } catch (e) {
        emit(LoginFailure('An unexpected error occurred'));
      }
    });
  }
}
