import 'package:flutter/material.dart';
import 'package:social_media/screens/login/bloc/login_bloc.dart';
import 'package:social_media/widgets/public_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = LoginBloc.of(context);
    return Form(
      key: bloc.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PublicTextFormField(
            controller: bloc.email,
            type: TextInputType.emailAddress,
            validate: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Your Email address';
              } else if (!value.contains('@')) {
                return 'this field must be contains @';
              }
              return null;
            },
            prefixIcon: Icons.email,
            label: 'Email Address',
          ),
          const SizedBox(
            height: 10.0,
          ),
          PublicTextFormField(
            controller: bloc.password,
            type: TextInputType.visiblePassword,
            isPassword: bloc.hidePass,
            onFieldSubmitted: (value) {},
            validate: (value) {
              if (value.toString().isEmpty || value == null) {
                return 'Empty Field';
              } else if (value.length < 6) {
                return 'this field must be at least 6 Values';
              } else {
                return null;
              }
            },
            prefixIcon: Icons.lock,
            suffixIcon: bloc.hidePass ? Icons.visibility_off : Icons.visibility,
            suffixPressed: () => bloc.add(LoginHidePassEvent()),
            label: 'Password',
          ),
        ],
      ),
    );
  }
}
