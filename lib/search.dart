import 'package:easy_search/core/custom_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'freeforum.dart';
import 'database.dart';
import 'Post.dart';
import 'color.dart';
import 'freeforum_detail.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _controller;

  bool onSearch = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int result = 0;

  @override
  Widget build(BuildContext context) {
    Post post4 = Post.clone(dataBase.post1);
    Post post5 = Post.clone(dataBase.post2);
    Post post6 = Post.clone(dataBase.post3);
    Post post7 = Post.clone(dataBase.post1);
    Post post8 = Post.clone(dataBase.post2);
    Post post9 = Post.clone(dataBase.post3);
    List<Post> postSet = [
      dataBase.post1,
      dataBase.post2,
      dataBase.post3,
      post4,
      post5,
      post6,
      post7,
      post8,
      post9
    ];

    List<int> set = [];

    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          SizedBox(height: 60),
          Center(
            child: Row(children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 40.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                ),
                child: TextField(
                  controller: _controller,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                        iconSize: 24.0,
                        color: Colors.grey.shade400,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 2)),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      hintText: '글 제목, 내용, 해시태그',
                      hintStyle: TextStyle(
                        fontSize: 18,
                      )),
                  onSubmitted: (String value) async {
                    setState(() {
                      onSearch = true;
                      for (int i = 0; i < postSet.length; i++) {
                        if (postSet[i].title.contains(value) == true ||
                            postSet[i].contents.contains(value) == true) {
                          set.add(i);
                          result++;
                        }
                      }
                    });
                  },
                ),
              ),
              TextButton(
                child: Text('취소',
                    style: TextStyle(color: Colors.black54, fontSize: 18.0)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]),
          ),
          Visibility(
            visible: onSearch ? false : true,
            child: Column(
              children: [
                SizedBox(height: 200),
                Icon(Icons.search_outlined,
                    size: 90.0, color: Colors.grey.shade400),
                Text(
                  '전체 게시판의 글을 검색해보세요',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          for (int i = 0; i < postSet.length; i++)
            if (set.contains(i))
              resultVisibility(onSearch, context, postSet, i),
        ])));
  }
}

Widget searchBox(BuildContext context, Post post) {
  int like = post.like;
  int comment = post.comment.length;
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => freeForumDetail(context, post)));
    },
    child: Container(
        color: Colors.white,
        height: 110,
        width: 420,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                width: 380,
                child: Text(
                  post.contents,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          post.time,
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.blueGrey),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          post.writer,
                          style:
                              TextStyle(fontSize: 13.0, color: Colors.blueGrey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.hand_thumbsup,
                          color: Palette.everyRed,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$like",
                          style: TextStyle(
                              color: Palette.everyRed, fontSize: 14.0),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          CupertinoIcons.chat_bubble,
                          color: Colors.blueAccent,
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "$comment",
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 430,
                height: 0.4,
                color: Colors.grey,
              )
            ],
          ),
        )),
  );
}

Widget resultVisibility(
    bool onSearch, BuildContext context, List<Post> postSet, int i) {
  return Visibility(
      visible: onSearch ? true : false, child: searchBox(context, postSet[i]));
}
