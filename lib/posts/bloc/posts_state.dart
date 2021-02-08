part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}


class PostsSuccess extends PostsState {
  final List<Post> posts;

  PostsSuccess(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostsLoading extends PostsState {}


