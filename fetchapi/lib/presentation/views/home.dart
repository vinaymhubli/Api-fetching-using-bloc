import 'package:fetchapi/data/model/postmodel.dart';
import 'package:fetchapi/logic/cubit/post_cubit.dart';
import 'package:fetchapi/logic/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "BLoC API",
          style: TextStyle(
              color: Colors.teal, fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          if (state is PostErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
            ));
          }
        },
        builder: (context, state) {
          if (state is PostLoadingSate) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PostLoadedState) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  Postmodel post = state.posts[index];

                  return ListTile(
                    title: Text(post.title.toString()),
                    subtitle: Text(post.id.toString()),
                  );
                });
          } else {
            return const Center(
              child: Text("An error has occured!"),
            );
          }
        },
      )),
    );
  }
}
