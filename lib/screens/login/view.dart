import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/navigation/navigation.dart';
import 'package:social_media/screens/home/view.dart';
import 'package:social_media/screens/login/bloc/login_bloc.dart';
import 'package:social_media/screens/register/view.dart';
import 'package:social_media/widgets/public_main_button.dart';
import 'package:social_media/widgets/public_snack_bar_alert.dart';
import 'package:social_media/widgets/public_string_button.dart';

import 'component/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigation.pushAndRemoveUntil(context, const HomeView());
            } else if (state is LoginErrorState) {
              publicSnackBarAlert(context: context, text: state.error);
            }
          },
          builder: (context, state) {
            LoginBloc bloc = LoginBloc.of(context);
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                      const Text(
                        'login now to browse our hot offers',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      const LoginForm(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      state is! LoginLoadingState
                          ? PublicMainButton(
                              function: () => bloc.add(LoginButtonEvent()),
                              text: 'LOGIN')
                          : const Center(child: CircularProgressIndicator()),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account? '),
                          PublicStringButton(
                            onPressed: () {
                              Navigation.push(context, const RegisterView());
                            },
                            text: 'register now ',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
