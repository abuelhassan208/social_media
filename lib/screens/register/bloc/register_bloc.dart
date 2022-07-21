import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/screens/register/model/user_model.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterHidePassEvent>((_changeHidePass));
    on<RegisterButtonPassEvent>((_registerButton));
    on<RegisterCreateUserEvent>((_createUser));
  }

  static RegisterBloc of(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  late String userId;
  bool hidePass = true;

  void _changeHidePass(
      RegisterHidePassEvent event, Emitter<RegisterState> emit) {
    hidePass = !hidePass;
    emit(RegisterHidePassState());
  }

  void _registerButton(
      RegisterButtonPassEvent event, Emitter<RegisterState> emit) async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      try {
        UserCredential response = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text);
        userId = response.user!.uid;
        emit(RegisterSuccessState());
      } on FirebaseAuthException catch (error) {
        if (error.code == 'weak-password') {
          emit(RegisterErrorState('The password provided is too weak.'));
        } else if (error.code == 'email-already-in-use') {
          emit(
              RegisterErrorState('The account already exists for that email.'));
        }
      } catch (error) {
        emit(RegisterErrorState(error.toString()));
      }
    }
  }

  void _createUser(
      RegisterCreateUserEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoadingState());
    try {
      UserModel user = UserModel(
          userId: userId,
          name: name.text,
          email: email.text,
          phone: phone.text);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(user.toMap());
      emit(CreateUserSuccessState());
    } on FirebaseFirestore catch (error) {
      emit(CreateUserErrorState(error.toString()));
    } catch (error) {
      emit(CreateUserErrorState(error.toString()));
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    name.dispose();
    phone.dispose();
    return super.close();
  }
}
