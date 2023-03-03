import 'package:fetchapi/data/model/postmodel.dart';

abstract class PostState {}

class PostLoadingSate extends PostState {}

class PostLoadedState extends PostState {
  final List<Postmodel> posts;
  PostLoadedState(this.posts);
}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}
