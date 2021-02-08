import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:upstreet_flutter_code_challenge/constants.dart';
import 'package:upstreet_flutter_code_challenge/posts/bloc/posts_bloc.dart';
import 'package:upstreet_flutter_code_challenge/posts/models/post.dart';

class EditPostScreen extends StatefulWidget {
  final Post post;

  EditPostScreen({Key key, @required this.post}) : super(key: key);

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  TextEditingController urlController;
  TextEditingController titleController;
  @override
  void initState() {
    super.initState();
    urlController = TextEditingController(text: widget.post.url);
    titleController = TextEditingController(text: widget.post.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Id: ${widget.post.id}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var box = Hive.box(POSTS_BOX);
          box.put(
            widget.post.id,
            widget.post.copyWith(
                title: titleController.text, url: urlController.text), // Should moce logic in bloc
          );
          FocusScope.of(context).unfocus();
          Navigator.pop(context);
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
