import 'package:bloc_state_management/features/home/data/models/home_mode.dart';
import 'package:bloc_state_management/features/home/data/repositories/api_repositories.dart';
import 'package:bloc_state_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
              create: (BuildContext context) => HomeBloc(ApiRepositories()))
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Bloc App'),
          ),
          body: blocBody(),
        ));
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => HomeBloc(
        ApiRepositories(),
      )..add(LoadHomeEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is HomeLoadedState) {
          List<HomeModel> usersList = state.users;

          return ListView.builder(
              itemCount: usersList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: Card(
                    color: Colors.blue,
                    child: ListTile(
                      title: Text(usersList[index].firstname.toString()),
                      subtitle: Text(usersList[index].lastname.toString()),
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(usersList[index].avatar.toString()),
                      ),
                    ),
                  ),
                );
              });
        }

        if (state is HomeErrorState) {
          return const Center(
            child: Text('Error'),
          );
        }
        return Container();
      }),
    );
  }
}
