import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/dashbord/domain/use_case/get_post_use_case.dart';
import 'package:flutter_clean_arch/features/dashbord/presentation/bloc/post_event.dart';
import 'package:flutter_clean_arch/features/dashbord/presentation/bloc/post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPost getPost;
  PostBloc(this.getPost):super(PostInitialState()){
    on<LoadPostEvent>(_onLoadPost);
  }

  FutureOr<void> _onLoadPost(LoadPostEvent event, Emitter<PostState> emit) async{
    emit(PostLoadingState());
    try {
      final post = await getPost();
      emit(PostSuccessState(post));
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}

