import 'package:bloc_state_management/features/postApi/presentation/pages/post_api_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const PostApiPage(),
      // home: const HomePage(),
      // home: RepositoryProvider(
      //   create: (context) => ApiRepositories(),
      //   child: const PostApiPage(),
      // )
    );
  }
}
