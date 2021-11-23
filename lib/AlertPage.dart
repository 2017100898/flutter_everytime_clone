import 'package:every/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color.dart';
import 'package:flutter/cupertino.dart';

class AlertPage extends StatefulWidget {
  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  var stage;
  bool click1 = false;
  bool click2 = false;
  bool click3 = false;
  bool click4 = false;
  bool click5 = false;
  bool click6 = false;

  @override
  void initState() {
    stage = 1;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Column(children: [
                      Text(
                        "알림",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: stage == 1 ? Colors.black : Colors.grey),
                      ),
                      Container(
                          width: 44.0,
                          height: 2,
                          color: stage == 1 ? Colors.black : Colors.white)
                    ]),
                    onTap: () {
                      setState(() {
                        stage = 1;
                      });
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: Column(children: [
                      Text(
                        "쪽지함",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: stage == 0 ? Colors.black : Colors.grey),
                      ),
                      Container(
                          width: 60.0,
                          height: 2,
                          color: stage == 0 ? Colors.black : Colors.white)
                    ]),
                    onTap: () {
                      setState(() {
                        stage = 0;
                      });
                    },
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            automaticallyImplyLeading: false,
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Visibility(
                    visible: stage == 1 ? true : false,
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            click1 == false ? click1 = true : click1 = false;
                          });
                        },
                        child: alarmBox(
                            CupertinoIcons.heart,
                            Colors.pinkAccent,
                            "학생복지스토어",
                            "전자기기에 대한 여러분의 생각을 들려주세요.",
                            "자세히보기",
                            click1),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            click2 == false ? click2 = true : click2 = false;
                          });
                        },
                        child: alarmBox(
                            CupertinoIcons.eyeglasses,
                            Colors.blue,
                            "째깍악어",
                            "받아쓰기 시급 1.5만원?!\n신개념 대학생 방문 선생님",
                            "자세히보기",
                            click2),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            click3 == false ? click3 = true : click3 = false;
                          });
                        },
                        child: alarmBox(
                            CupertinoIcons.moon,
                            Colors.orangeAccent,
                            "체그스터디",
                            "수백만 개의 과제 해답\n체그스터디로 해결하세요!",
                            "알아보기",
                            click3),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            click4 == false ? click4 = true : click4 = false;
                          });
                        },
                        child: alarmBox(
                            CupertinoIcons.heart,
                            Colors.pinkAccent,
                            "학생복지스토어",
                            "프로다운 막강한 파워. MacBook Pro 14, 16",
                            "사전 예약",
                            click4),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            click5 == false ? click5 = true : click5 = false;
                          });
                        },
                        child: alarmBox(
                            CupertinoIcons.heart,
                            Colors.pinkAccent,
                            "학생복지스토어",
                            "만족스러운 성능. 기분 좋은 가격. iPad",
                            "사전 예약",
                            click5),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            click6 == false ? click6 = true : click6 = false;
                          });
                        },
                        child: alarmBox(
                            CupertinoIcons.heart,
                            Colors.pinkAccent,
                            "학생복지스토어",
                            "iPhon 13. 일상을 위한 비상한 능력\n10/1(금) 0시",
                            "바로가기",
                            click6),
                      ),
                    ]),
                  )
                ]))));
  }
}

Widget alarmBox(IconData icon, Color color, String title, String contents,
    String button, bool click) {
  return Padding(
    padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
    child: Expanded(
      child: Container(
        color: click == false ? Colors.yellow.shade50 : Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(icon, color: color),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    Container(
                      child: Text(
                        "  AD  ",
                        style: TextStyle(color: Palette.everyRed, fontSize: 11),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Palette.everyRed, width: 0.5),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  Text(contents),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(button,
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(90, 30),
                        primary: Palette.everyRed,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        elevation: 0.0,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
