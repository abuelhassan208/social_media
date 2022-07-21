import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/core/navigation/navigation.dart';
import 'package:social_media/screens/login/view.dart';
import 'package:social_media/screens/register/bloc/register_bloc.dart';
import 'package:social_media/screens/register/component/register_form.dart';
import 'package:social_media/widgets/public_main_button.dart';
import 'package:social_media/widgets/public_snack_bar_alert.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        RegisterBloc bloc = RegisterBloc.of(context);
        if (state is RegisterSuccessState) {
          bloc.add(RegisterCreateUserEvent());
        } else if (state is CreateUserSuccessState) {
          Navigation.push(context, const LoginView());
        } else if (state is RegisterErrorState) {
          publicSnackBarAlert(context: context, text: state.error);
        } else if (state is CreateUserErrorState) {
          publicSnackBarAlert(context: context, text: state.error);
        }
      },
      builder: (context, state) {
        RegisterBloc bloc = RegisterBloc.of(context);
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Register',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.teal),
                  ),
                  Text(
                    'Register now to browse our hot offers',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  RegisterFrom(bloc: bloc),
                  state is! RegisterLoadingState
                      ? PublicMainButton(
                      function: () {
                        bloc.add(RegisterButtonPassEvent());},
                      text: 'Register')
                      : const Center(child: CircularProgressIndicator()),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
