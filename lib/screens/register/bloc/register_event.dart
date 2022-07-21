part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
class RegisterHidePassEvent extends RegisterEvent{}
class RegisterButtonPassEvent extends RegisterEvent{}
class RegisterCreateUserEvent extends RegisterEvent{}
