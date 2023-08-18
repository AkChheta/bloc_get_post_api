import 'package:bloc_state_management/features/home/data/models/home_mode.dart';
import 'package:bloc_state_management/features/home/data/repositories/api_repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiRepositories _apiRepositories;
  HomeBloc(this._apiRepositories) : super(HomeLoadingState()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(HomeLoadingState());

      try {
        final users = await _apiRepositories.fetchData();
        emit(HomeLoadedState(users));
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }
}
