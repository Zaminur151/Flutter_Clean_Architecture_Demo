import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/dashbord/data/data_sources/remote_data_source.dart';
import 'package:flutter_clean_arch/features/dashbord/data/repositories/post_repository_impl.dart';
import 'package:flutter_clean_arch/features/dashbord/domain/use_case/get_post_use_case.dart';
import 'package:flutter_clean_arch/features/dashbord/presentation/bloc/post_bloc.dart';
import 'package:flutter_clean_arch/features/dashbord/presentation/pages/dashboard_screen.dart';

void main() {
  final dataSource = PostRemoteDataSource();
  final repository = PostRepositoryImpl(remoteDataSource: dataSource);
  final getPost = GetPost(repository: repository);
  runApp( MyApp(getPost: getPost));
}

class MyApp extends StatelessWidget {
  final GetPost getPost;
  const MyApp({super.key, required this.getPost});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (_) =>PostBloc(getPost),
        child: DashboardScreen(),
        )
    );
  }
}