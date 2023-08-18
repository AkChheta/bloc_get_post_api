import 'package:bloc_state_management/features/postApi/data/repositories/login_api_repositories.dart';
import 'package:bloc_state_management/features/postApi/presentation/bloc/form_submission_status.dart';
import 'package:bloc_state_management/features/postApi/presentation/bloc/postapi_bloc.dart';
import 'package:bloc_state_management/features/postApi/presentation/bloc/postapi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostApiPage extends StatefulWidget {
  const PostApiPage({super.key});

  @override
  State<PostApiPage> createState() => _PostApiPageState();
}

class _PostApiPageState extends State<PostApiPage> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) =>
          PostapiBloc(loginApiRepositories: LoginApiRepositories()),
      child: _loginForm(),
    ));
  }

  Widget _loginForm() {
    return BlocListener<PostapiBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formSubmissionStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackbar(context, formStatus.exception.toString());
        }
      },
      child: Form(
          key: _formkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_userNameField(), _passwordField(), _loginButton()],
            ),
          )),
    );
  }

  Widget _userNameField() {
    return BlocBuilder<PostapiBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.person), hintText: 'Usename'),
          validator: (value) =>
              state.isValidusername ? null : 'UserName is too short',
          onChanged: (value) =>
              context.read<PostapiBloc>().add(LoginUserNameChanged(value)),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<PostapiBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              icon: Icon(Icons.security), hintText: 'Password'),
          validator: (value) =>
              state.isValidpassword ? null : 'Password is too short',
          onChanged: (value) =>
              context.read<PostapiBloc>().add(LoginPasswordChanged(value)),
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<PostapiBloc, LoginState>(
      builder: (context, state) {
        return state.formSubmissionStatus is FormSubmitting
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    context.read<PostapiBloc>().add(LoginSubmitted());
                  }
                },
                child: Text("Lgin"));
      },
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
