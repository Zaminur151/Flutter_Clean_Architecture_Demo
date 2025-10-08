import 'package:flutter_clean_arch/features/dashbord/data/models/post_model.dart';

abstract class PostState {}

class PostInitialState implements PostState{}
class PostLoadingState implements PostState{}
class PostErrorState implements PostState{
  final String message;
  PostErrorState(this.message);
}
class PostSuccessState implements PostState{
  final List<PostModel> post;
  PostSuccessState(this.post);
}