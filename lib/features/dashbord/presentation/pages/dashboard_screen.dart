import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/dashbord/presentation/bloc/post_bloc.dart';
import 'package:flutter_clean_arch/features/dashbord/presentation/bloc/post_event.dart';
import 'package:flutter_clean_arch/features/dashbord/presentation/bloc/post_state.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context,state){
          if(state is PostInitialState){
            return Center(
              child: ElevatedButton(
                onPressed: (){
                  context.read<PostBloc>().add(LoadPostEvent());
                }, 
                child: Text('Load Posts')
                ),
            );
          }
          else if(state is PostLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is PostSuccessState){
            return ListView.builder(
              itemCount: state.post.length,
              itemBuilder: (context,index){
                final post = state.post[index];
                return ListTile(
                  title: Text("${post.id} ${post.title}"),
                  subtitle: Text(post.body),
                );
              }
              );
          }
          else if (state is PostErrorState){
            return Center(
              child: Text(state.message),
            );
          }
          else{
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}