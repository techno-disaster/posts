import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:upstreet_flutter_code_challenge/constants.dart';
import 'package:upstreet_flutter_code_challenge/posts/models/post.dart';

Future<List<Post>> getData() async {
  print("getting data");
  var box = Hive.box(POSTS_BOX);
  final List<Post> posts = [];
  //box.deleteFromDisk();
  if (box.isEmpty) {
    var response = await http.get(API_ALBUMS_PHOTOS);
    List<dynamic> _data = jsonDecode(response.body);
    final List<Post> _posts = _data
        .map(
          (e) => Post(
            album: e["albumId"],
            id: e["id"],
            title: e["title"],
            url: e["thumbnailUrl"],
          ),
        )
        .toList(growable: false);

    for (Post post in _posts) {
      box.put(post.id, post);
      posts.add(post);
    }
    return posts;
  }
  for (int key = 0; key < box.length; key++) {
    posts.add(box.getAt(key)); //if bloc is not empty, get all values into posts list
  }
  return posts;
}
