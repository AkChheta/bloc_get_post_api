import 'package:bloc_state_management/features/postApi/data/repositories/login_api_repositories.dart';
import 'package:bloc_state_management/features/postApi/presentation/bloc/form_submission_status.dart';
import 'package:bloc_state_management/features/postApi/presentation/bloc/postapi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'postapi_event.dart';

class PostapiBloc extends Bloc<LoginEvent, LoginState> {
  final LoginApiRepositories? loginApiRepositories;
  PostapiBloc({this.loginApiRepositories}) : super(LoginState()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginUserNameChanged) {
        emit(state.copyWith(userName: event.usename));
      } else if (event is LoginPasswordChanged) {
        emit(state.copyWith(password: event.password));
      } else if (event is LoginSubmitted) {
        emit(state.copyWith(formSubmissionStatus: FormSubmitting()));

        try {
          await loginApiRepositories?.login();
          emit(state.copyWith(formSubmissionStatus: SubmissionSuccess()));
        } catch (e) {
          emit(state.copyWith(
              formSubmissionStatus: SubmissionFailed(Exception(e))));
        }
      }
    });
  }
}
