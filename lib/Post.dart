import 'package:flutter/widgets.dart';
import 'app.dart';

class Post {
  String title;
  String contents;
  String writer;
  String time;
  int like;
  List<String> comment;

  Post(
    this.title,
    this.contents,
    this.writer,
    this.time,
    this.like,
    this.comment,
  );

  Post.clone(Post post)
      : this(
          post.title,
          post.contents,
          post.writer,
          post.time,
          post.like,
          post.comment,
        );
}
