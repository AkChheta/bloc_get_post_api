// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final List<HomeModel> users;
  HomeLoadedState(this.users);
  @override
  List<Object> get props => [users];
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
  @override
  List<Object> get props => [error];
}
