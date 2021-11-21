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
import 'database.dart';

class freeForum extends StatelessWidget {
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
