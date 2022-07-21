import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginHidePassEvent>((changeHidePass));
    on<LoginButtonEvent>((_loginButton));
  }

  static LoginBloc of(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool hidePass = true;

  void changeHidePass(LoginHidePassEvent event, Emitter<LoginState> emit) {
    hidePass = !hidePass;
    emit(LoginHidePassState());
  }

  void _loginButton(LoginButtonEvent event, Emitter<LoginState> emit) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      try {
        var response = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text, password: password.text);
        emit(LoginSuccessState());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(LoginErrorState('No user found for that email.'));
        } else if (e.code == 'wrong-password') {
          emit(LoginErrorState('Wrong password provided for that user.'));
        }
      } catch (error, path) {
        emit(LoginErrorState(error.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
