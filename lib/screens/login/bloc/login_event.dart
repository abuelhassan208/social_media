part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginHidePassEvent extends LoginEvent{}
class LoginButtonEvent extends LoginEvent{}
