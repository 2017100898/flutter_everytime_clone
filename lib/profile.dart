import 'package:flutter/material.dart';
import 'home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'home_page.dart';
import 'login.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '내 정보',
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
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Container(
                          height: 100,
                          width: 400,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Image.asset('assets/profile.jpg',
                                        height: 60, width: 60),
                                  ),
                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('student id',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text('이름 /  닉네임',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13.0,
                                            )),
                                        Text('학교와 학번',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13.0,
                                            )),
                                      ]),
                                ]),
                                Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.qr_code),
                                          Text('QR 인증')
                                        ])),
                              ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Container(
                          height: 250,
                          width: 400,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('계정',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextButton(
                                      child: Text('학교 인증  ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                  TextButton(
                                      child: Text('비밀번호 변경',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                  TextButton(
                                      child: Text('이메일 변경',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                ]),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Container(
                          height: 330,
                          width: 400,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('커뮤니티',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextButton(
                                      child: Text('닉네임 설정',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                  TextButton(
                                      child: Text('프로필 이미지 변경',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                  TextButton(
                                      child: Text('이용 제한 내역',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                  TextButton(
                                      child: Text('쪽지 설정  ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                  TextButton(
                                      child: Text('커뮤니티 이용규칙',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                ]),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Container(
                          height: 300,
                          width: 400,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('앱 설정',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                          child: Text('다크모드  ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15.0)),
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero)),
                                      TextButton(
                                          child: Text('시스템 기본값',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13.0)),
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                              padding: EdgeInsets.zero)),
                                    ],
                                  ),
                                  TextButton(
                                      child: Text('알림 설정 ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                  TextButton(
                                      child: Text('암호 잠금 ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                  TextButton(
                                      child: Text('캐시 삭제 ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                ]),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Container(
                          height: 230,
                          width: 400,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('기타',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    child: Text('정보 동의 설정',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0)),
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero)),
                                TextButton(
                                    child: Text('회원 탈퇴  ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0)),
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero)),
                                TextButton(
                                    child: Text('로그아웃  ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.0)),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/');
                                    },
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero)),
                              ])),
                    ),
                  ]),
                ))));
  }
}
