import 'package:every/login.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'search.dart';
import 'ListPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';
import 'home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'color.dart';

import 'app.dart';
import 'User.dart';
import 'login.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pos = 0;
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        _pos = (_pos + 1) % 4;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Container(),
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 10),
                  Text(
                    '에브리타임',
                    style: TextStyle(color: Palette.everyRed, fontSize: 13),
                  ),
                  Text(
                    onUser!.school,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Search()));
                },
                icon: Icon(Icons.search),
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  icon: Icon(Icons.person_outline, size: 26),
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SafeArea(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          first_widget(1, '나만의 채용 일정 관리법', '인기 공고 확인하고 일정 관리하기',
                              ' 자세히 > ', Colors.orange, 30, 0),
                          first_widget(2, '오늘의 할일', '9월 19일 (일)', ' 추가 + ',
                              Colors.blueAccent, 10, 10),
                        ]))),
                SafeArea(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.fromLTRB(30, 0, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            circleLink('http://www.khu.ac.kr', "home", '학교\n홈'),
                            circleLink(
                                'https://info21.khu.ac.kr/com/LoginCtr/login.do?sso=ok',
                                "earth",
                                '인포21'),
                            circleLink(
                                'https://khu.ac.kr/kor/sub/tab.do?MENU_SEQ=278&TAB_SEQ=282',
                                "bus",
                                '셔틀\n버스'),
                            circleLink(
                                'https://www.khu.ac.kr/kor/notice/list.do?category=UNDERGRADUATE&page=1',
                                "notification",
                                '학사\n공지'),
                            circleLink('http://shaksa.khu.ac.kr/07/01.php',
                                "schedule", '학사\n일정'),
                            circleLink('https://library.khu.ac.kr/seoul',
                                "book", '도서관'),
                            circleLink(
                                'https://mail.khu.ac.kr', "earth", '웹메일'),
                          ],
                        ))),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: 100,
                    width: 400,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/f_ad$_pos.jpg"),
                          fit: BoxFit.fill),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                      height: 300,
                      width: 400,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('즐겨찾는 게시판',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                    child: TextButton(
                                      child: Text('더 보기 >',
                                          style: TextStyle(
                                              color: Palette.everyRed,
                                              fontSize: 15.0)),
                                      onPressed: () {
                                        context.read<HomeCubit>().getList();
                                      },
                                    ),
                                  )
                                ]),
                            SizedBox(
                              height: 8,
                            ),
                            favoritePost(
                                context, '자유게시판', '너네 베일리 알아? 그 어플 짱 좋음'),
                            favoritePost(context, '정보게시판', '수강신청 기간 안내'),
                            favoritePost(context, '홍보게시판', '환경동아리 둥지둥지 부원 모집'),
                            favoritePost(context, '장터게시판', '바지 저렴하게 팔아요'),
                          ])),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Container(
                      height: 330,
                      width: 400,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text('실시간 인기 글',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5,
                            ),
                            popularPost(context, '둥지들과 함께하는 즐거운 일요일',
                                '추천하면 이번 학기 올 A+', '자유게시판', '63', '76'),
                            popularPost(context, '후드 집업 공구할 사람?',
                                '후드 집업 같이 공구할 사람 구해용~', '자유게시판', '241', '20'),
                          ])),
                ),
              ])),
        )));
  }
}

void flutterToast() {
  Fluttertoast.showToast(
      msg: '페이지가 아직 만들어지지 않았어요.',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      fontSize: 15.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG);
}

Widget circleLink(String urlLink, String icon, String Title) {
  return GestureDetector(
    onTap: () {
      launch(urlLink, forceWebView: true, forceSafariVC: true);
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              width: 53,
              height: 53,
              decoration: BoxDecoration(
                color: Color(0xfff9f9f9),
                shape: BoxShape.circle,
              ),
            ),
            Positioned.fill(
                child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Image.asset("assets/$icon.jpg"),
                      height: 23,
                      width: 32,
                    ))),
          ],
        ),
        Text(
          Title,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget first_widget(var num, String title, String description, String smallText,
    Color color, double x, double y) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 20),
    child: Container(
        margin: EdgeInsets.only(left: x, right: y),
        height: 200,
        width: 350,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Container(
                  height: 26,
                  width: 26,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icon_$num.jpg"),
                          fit: BoxFit.fill))),
            ),
            SizedBox(width: 13),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Text(
                  description,
                  style: TextStyle(color: color, fontSize: 13),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      //flutterToast();
                    },
                    child: Text(smallText,
                        style: TextStyle(color: Colors.black, fontSize: 14)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        elevation: 0.0,
                        padding: EdgeInsets.zero))
              ],
            ),
          ],
        )),
  );
}

Widget favoritePost(BuildContext context, String list, String post) {
  return TextButton(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  list,
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
                SizedBox(width: 20),
                Text(
                  post,
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 14.0),
                ),
              ],
            ),
            Container(
              height: 13,
              width: 13,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/new_icon.jpg"), fit: BoxFit.fill),
              ),
            ),
          ]),
      onPressed: () {
        context.read<HomeCubit>().getList();
      },
      style: TextButton.styleFrom(padding: EdgeInsets.zero));
}

Widget popularPost(BuildContext context, String title, String text, String list,
    String num1, String num2) {
  return TextButton(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/profile.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '익명',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                list,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 14.0),
              ),
              Container(
                  child: Row(children: [
                Icon(
                  Icons.thumb_up_outlined,
                  color: Palette.everyRed,
                  size: 14,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  num1,
                  style: TextStyle(color: Palette.everyRed, fontSize: 14.0),
                ),
                SizedBox(
                  width: 7,
                ),
                Icon(
                  Icons.message_outlined,
                  color: Colors.blueAccent,
                  size: 14,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  num2,
                  style: TextStyle(color: Colors.blueAccent, fontSize: 14.0),
                ),
              ])),
            ]),
            SizedBox(height: 10),
          ]),
      onPressed: () {
        context.read<HomeCubit>().getList();
      },
      style: TextButton.styleFrom(padding: EdgeInsets.zero));
}
