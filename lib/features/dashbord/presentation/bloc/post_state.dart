import 'package:flutter_clean_arch/features/dashbord/data/models/post_model.dart';

abstract class PostState {}

class PostInitialState extends PostState{}
class PostLoadingState extends PostState{}
class PostErrorState extends PostState{
  final String message;
  PostErrorState(this.message);
}
class PostSuccessState extends PostState{
  final List<PostModel> post;
  PostSuccessState(this.post);
}