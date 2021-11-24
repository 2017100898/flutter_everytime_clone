import 'package:every/login.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'search.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'color.dart';
import 'package:flutter/cupertino.dart';
import 'login.dart';
import 'freeforum.dart';
import 'package:flutter/cupertino.dart';

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
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    int day = date.day;
    int month = date.month;

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
                icon: Icon(CupertinoIcons.search, size: 23),
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                  icon: Icon(CupertinoIcons.person, size: 23),
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
                          first_widget(2, '오늘의 할일', '$month월 $day일', ' 추가 + ',
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
                  padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: Expanded(
                    child: Container(
                      height: 100,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/f_ad$_pos.jpg"),
                            fit: BoxFit.fill),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                            Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Expanded(
                    child: Container(
                        height: 300,
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
                              favoritePost(
                                  context, '홍보게시판', '환경동아리 둥지둥지 부원 모집'),
                              favoritePost(context, '장터게시판', '바지 저렴하게 팔아요'),
                            ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 20, right: 10, left: 10),
                  child: Expanded(
                    child: Container(
                        height: 330,
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
                ),
                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 20, right: 10, left: 10),
                      child: Expanded(
                          child: Container(
                              height: 530,
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1),
                              ),
                              child: Text('추천 정보',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold))))),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(children: [
                            adContainer(
                                context,
                                CupertinoIcons.suit_club_fill,
                                "아디다스 오리지널스",
                                "나의 윈터 룩, 오직 나답게",
                                "겨울에 대한 꽉 막힌 생각들\n이젠 벗어, 버릴 때가 됐어.",
                                "자세히 보기",
                                7),
                            adContainer(
                                context,
                                CupertinoIcons.heart_fill,
                                "bcc",
                                "겨울을 뜨겁게 부스트, bcc 부스트푸퍼",
                                "부스트 3단 기능과 함께 올 겨울을 뜨겁게 보내세요.\n",
                                "구매하러 가기",
                                6),
                            adContainer(
                                context,
                                CupertinoIcons.phone_fill,
                                "삼성전자",
                                "삼성전자 공식 할인몰 갤럭시 캠퍼스 스토어",
                                "갤럭시 캠퍼스 투어로 대학생 필수템 장만하기\n대학생 인증하면? 기본 교육할인가 10%에 추가혜택!",
                                "가입만해도 특별혜택",
                                5),
                          ]),
                        )),
                  ),
                ]),
              ])),
        )));
  }
}
/*
void flutterToast() {
  Fluttertoast.showToast(
      msg: '페이지가 아직 만들어지지 않았어요.',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      fontSize: 15.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG);
}*/

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
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => freeForum()));
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
                  CupertinoIcons.hand_thumbsup,
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
                  CupertinoIcons.chat_bubble,
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

Widget adContainer(
  BuildContext context,
  IconData icon,
  String company,
  String title,
  String contents,
  String button,
  int imgnum,
) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width - 60,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 10,
              ),
              Text(
                company,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ],
          ),
          Container(
            child: Text(
              "  AD  ",
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.grey.shade100, width: 0.5),
            ),
          )
        ]),
      ),
    ),
    Container(
        height: 280,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13.0),
            image: DecorationImage(
                image: AssetImage("assets/IMG_781$imgnum.jpg"),
                fit: BoxFit.fill))),
    Container(
      child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
                Text(
                  contents,
                  style: TextStyle(fontSize: 17),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(button,
                          style:
                              TextStyle(color: Palette.everyRed, fontSize: 14)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Palette.everyRed),
                              borderRadius: BorderRadius.circular(50)),
                          elevation: 0.0)),
                ),
              ])),
    ),
  ]);
}
