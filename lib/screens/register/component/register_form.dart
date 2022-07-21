import 'package:flutter/material.dart';
import 'package:social_media/screens/register/bloc/register_bloc.dart';
import 'package:social_media/widgets/public_text_form_field.dart';

class RegisterFrom extends StatelessWidget {
  final RegisterBloc bloc;
  const RegisterFrom({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: bloc.formKey,
      child: Column(
        children: [
          PublicTextFormField(
            controller: bloc.name,
            type: TextInputType.emailAddress,
            validate: (value) {
              if (value.toString().isEmpty || value == null) {
                return 'Empty Field';
              } else if (value.length < 2) {
                return 'this field must be at least 2 Values';
              } else {
                return null;
              }
            },
            prefixIcon: Icons.person,
            label: 'Name',
          ),
          PublicTextFormField(
            controller: bloc.email,
            type: TextInputType.emailAddress,
            validate: (value) {
              if (value.toString().isEmpty || value == null) {
                return 'Empty Field';
              } else if (value.length < 6) {
                return 'this field must be at least 6 Values';
              } else if (!value.contains('@')) {
                return 'this field must be contains @';
              } else {
                return null;
              }
            },
            prefixIcon: Icons.email,
            label: 'Email Address',
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
            suffixPressed: () {
              bloc.add(RegisterHidePassEvent());
            },
            label: 'Password',
          ),
          PublicTextFormField(
            controller: bloc.phone,
            type: TextInputType.phone,
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
            label: 'Phone',
            prefixIcon: Icons.phone,
          ),
        ]
            .map((item) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: item,
                ))
            .toList(),
      ),
    );
  }
}
