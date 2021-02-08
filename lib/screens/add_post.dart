import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:upstreet_flutter_code_challenge/constants.dart';
import 'package:upstreet_flutter_code_challenge/posts/bloc/posts_bloc.dart';
import 'package:upstreet_flutter_code_challenge/posts/models/post.dart';

class AddPostScreen extends StatelessWidget {
  final urlController = TextEditingController();
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Post"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var box = Hive.box(POSTS_BOX);
          box.put(
            box.length + 1,
            Post(
                album: 1,
                id: box.length + 1,
                title: titleController.text,
                url: urlController.text), //Should move logic into bloc
          );
          FocusScope.of(context).unfocus();
          Navigator.pop(context);
          BlocProvider.of<PostsBloc>(context).add((GetPosts()));
        },
        child: Icon(Icons.save),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(hintText: "Enter url"),
                controller: urlController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextFormField(
                decoration: InputDecoration(hintText: "Enter title"),
                controller: titleController,
              ),
            )
          ],
        ),
      )),
    );
  }
}
