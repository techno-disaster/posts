import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:upstreet_flutter_code_challenge/posts/models/post.dart';
import 'package:upstreet_flutter_code_challenge/services/api.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial());

  @override
  Stream<PostsState> mapEventToState(
    PostsEvent event,
  ) async* {
    if (event is GetPosts) {
      yield* mapEventToPostsSuccessState(event);
    } //no more cases needed
  }
}

Stream<PostsState> mapEventToPostsSuccessState(PostsEvent event) async* {
  yield PostsLoading();
  try {
    final List<Post> posts = await getData();
    yield PostsSuccess(posts);
  } catch (e) {}
}
