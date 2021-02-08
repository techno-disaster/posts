import 'package:flutter/material.dart';
import 'package:upstreet_flutter_code_challenge/posts/models/post.dart';
import 'package:upstreet_flutter_code_challenge/screens/edit_post.dart';

class PostDetails extends StatelessWidget {
  final Post post;

  const PostDetails({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Id: ${post.id}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPostScreen(
                post: post,
              ),
            )),
        child: Icon(Icons.edit),
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Image.network(post.url),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(post.title),
          )
        ],
      )),
    );
  }
}
