import 'package:flutter_clean_arch/features/dashbord/data/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPost();
}