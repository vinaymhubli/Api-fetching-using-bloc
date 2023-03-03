import 'package:dio/dio.dart';
import 'package:fetchapi/data/model/postmodel.dart';
import 'package:fetchapi/data/model/repository/post_repo.dart';
import 'package:fetchapi/logic/cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingSate()) {
    fetchPosts();
  }
  Repository repository = Repository();
  void fetchPosts() async {
    try {
      List<Postmodel> posts = await repository.fetchPosts();
      emit(PostLoadedState(posts));
    } on DioError catch (e) {
      if (e.type == DioErrorType.unknown) {
        emit(PostErrorState("Check your internet connectivity"));
      } else {
        emit(PostErrorState(e.type.toString()));
      }
    }
  }
}
