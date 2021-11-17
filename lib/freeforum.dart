import 'package:flutter/material.dart';
import 'home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'home_page.dart';
import 'login.dart';
import 'color.dart';
import 'dart:async';
import 'app.dart';
import 'User.dart';
import 'login.dart';
import 'package:flutter/cupertino.dart';
import 'Post.dart';
import 'freeforum_detail.dart';

class freeForum extends StatelessWidget {
  Post post1 = Post(
      "너네 베일리 알아? 그 어플 짱 좋음",
      "나도 지인한테 들어서 우연히 알게 됨!!!! 홍보 저어어얼대 아님ㅎㅎㅋㅋㅎㅎㅎ 🐿",
      "익명",
      "11/17",
      2,
      ["뭐하는 어플이야?", "홍보검거😂", "믿고 써볼게!!!", "댓글4", "댓글5", "댓글6"]);
  Post post2 =
      Post("둥지들과 함께하는 즐거운 일요일", "추천하면 이번 학기 올 A+", "익명", "11/17", 63, []);
  Post post3 = Post("오늘 학식 머양?-?", "냉면 나오면 좋겠당~", "익명", "11/17", 0,
      ["냉면 최고 🤍", "배고파 🤤🤤🤤"]);

  @override
  Widget build(BuildContext context) {
    Post post4 = Post.clone(post1);
    Post post5 = Post.clone(post2);
    Post post6 = Post.clone(post3);
    Post post7 = Post.clone(post1);
    Post post8 = Post.clone(post2);
    Post post9 = Post.clone(post3);
    List<Post> postSet = [
      post1,
      post2,
      post3,
      post4,
      post5,
      post6,
      post7,
      post8,
      post9
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '자유게시판',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Stack(children: [
              CupertinoNavigationBarBackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xff252532),
              ),
            ]),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(children: [
                    for (int i = 0; i < postSet.length; i++)
                      contextBox(context, postSet[i])
                  ]),
                ))));
  }
}

Widget contextBox(BuildContext context, Post post) {
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
