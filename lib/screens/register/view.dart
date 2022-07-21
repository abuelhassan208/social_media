import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/screens/register/bloc/register_bloc.dart';
import 'package:social_media/screens/register/component/register_app_bar.dart';
import 'package:social_media/screens/register/component/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Scaffold(
        appBar: registerAppBar(),
        body: const RegisterBody(),
      ),
    );
  }
}
