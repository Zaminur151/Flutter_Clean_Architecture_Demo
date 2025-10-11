import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/all_products/data/data_source/products_remote_data_source.dart';
import 'package:flutter_clean_arch/features/all_products/data/repositories/product_repo_impl.dart';
import 'package:flutter_clean_arch/features/all_products/domain/use_case/products_use_case.dart';
import 'package:flutter_clean_arch/features/dashbord/data/data_sources/remote_data_source.dart';
import 'package:flutter_clean_arch/features/dashbord/data/repositories/post_repository_impl.dart';
import 'package:flutter_clean_arch/features/dashbord/domain/use_case/get_post_use_case.dart';
import 'package:flutter_clean_arch/features/dashbord/presentation/bloc/post_bloc.dart';
import 'package:flutter_clean_arch/features/dashbord/presentation/pages/dashboard_screen.dart';

void main() {
  final dataSource = PostRemoteDataSource();
  final productsDataSource = ProductsRemoteDataSource();

  final repository = PostRepositoryImpl(remoteDataSource: dataSource);
  final productRepository = ProductRepoImpl(productsRemoteDataSource: productsDataSource);

  final getPost = GetPost(repository: repository);
  final productUseCase = ProductsUseCase(productRepository: productRepository);
  
  runApp( MyApp(getPost: getPost, productsUseCase: productUseCase));
}

class MyApp extends StatelessWidget {
  final GetPost getPost;
  final ProductsUseCase productsUseCase;
  const MyApp({super.key, required this.getPost, required this.productsUseCase});

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



