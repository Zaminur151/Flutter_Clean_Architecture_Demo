import 'package:flutter_clean_arch/features/dashbord/data/data_sources/remote_data_source.dart';
import 'package:flutter_clean_arch/features/dashbord/data/models/post_model.dart';
import 'package:flutter_clean_arch/features/dashbord/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository{
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PostModel>> getPost() async{
    return await remoteDataSource.fatchPost();
  }

}