import 'package:flutter_clean_arch/features/dashbord/domain/repository/post_repository.dart';

class GetPost{
  final PostRepository repository;
  GetPost({required this.repository});

  Future call() async{
    return await repository.getPost();
  }
}