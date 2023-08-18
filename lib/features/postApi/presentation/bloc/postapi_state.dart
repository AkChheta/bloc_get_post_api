import 'package:bloc_state_management/features/postApi/presentation/bloc/form_submission_status.dart';

class LoginState {
  final String userName;
  bool get isValidusername => userName.length > 3;

  final String password;
  bool get isValidpassword => password.length > 6;

  final FormSubmissionStatus formSubmissionStatus;

  LoginState(
      {this.userName = '',
      this.password = '',
      this.formSubmissionStatus = const InitialFormStatus()});

  LoginState copyWith({
    String? userName,
    String? password,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return LoginState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
