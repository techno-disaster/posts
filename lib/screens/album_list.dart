import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upstreet_flutter_code_challenge/posts/bloc/posts_bloc.dart';
import 'package:upstreet_flutter_code_challenge/posts/models/post.dart';
import 'package:upstreet_flutter_code_challenge/screens/add_post.dart';
import 'package:upstreet_flutter_code_challenge/screens/post_details.dart';

class AlbumList extends StatefulWidget {
  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPostScreen(),
            )),
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(builder: (context, state) {
        if (state is PostsSuccess) {
          List<Post> posts = state.posts.reversed.toList();
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.network(
                  posts[index].url,
                ),
                title: Text(posts[index].title),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetails(
                      post: posts[index],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (state is PostsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Container();
      }),
    );
  }
}
