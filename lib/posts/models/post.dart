import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'post.g.dart';

@HiveType(typeId: 0)
class Post extends Equatable {
  @HiveField(0)
  final int album;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String url;

  Post({this.album, this.id, this.title, this.url});

  Post copyWith({
    int album,
    int id,
    String title,
    String url,
  }) {
    return Post(
      album: album ?? this.album,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  @override
  List<Object> get props => [album, id, title, url];
}
