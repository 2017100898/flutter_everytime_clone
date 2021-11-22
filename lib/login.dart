import 'package:flutter/material.dart';
import 'color.dart';
import 'app.dart';
import 'User.dart';

User? onUser;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double keyboard = MediaQuery.of(context).viewInsets.bottom;

    return WillPopScope(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 130, bottom: 100.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Visibility(
                          visible: keyboard > 0 ? false : true,
                          child: Column(
                            children: [
                              Container(
                                  height: 80,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/everytime.jpg"),
                                        fit: BoxFit.fill),
                                  )),
                              SizedBox(height: 10),
                              Text('대학생활을 더 편하고 즐겁게',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 17)),
                              Text('에브리타임',
                                  style: TextStyle(
                                      color: Palette.everyRed,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Form(
                            child: Theme(
                                data: ThemeData(
                                    primaryColor: Colors.redAccent,
                                    inputDecorationTheme: InputDecorationTheme(
                                        labelStyle: TextStyle(
                                            color: Colors.grey, fontSize: 13))),
                                child: Container(
                                    padding: EdgeInsets.all(40.0),
                                    child: Column(children: [
                                      Container(
                                        width: 335,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, bottom: 3),
                                          child: TextField(
                                            controller: controller,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '아이디',
                                              hintStyle: const TextStyle(
                                                  color: Color(0xb3252532),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "NotoSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.0),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 4.0),
                                      Container(
                                        width: 335,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(50.0)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, bottom: 3),
                                          child: TextField(
                                            controller: controller2,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: '비밀번호',
                                              hintStyle: const TextStyle(
                                                  color: Color(0xb3252532),
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "NotoSans",
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 15.0),
                                            ),
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ButtonTheme(
                                          child: ElevatedButton(
                                              onPressed: () {
                                                if (controller.text ==
                                                        user1.id &&
                                                    controller2.text ==
                                                        user1.password) {
                                                  Navigator.pushNamed(
                                                      context, '/start');
                                                  setState(() {
                                                    onUser = User.clone(user1);
                                                  });
                                                } else if (controller.text ==
                                                        user2.id &&
                                                    controller2.text ==
                                                        user2.password) {
                                                  Navigator.pushNamed(
                                                      context, '/start');
                                                  setState(() {
                                                    onUser = User.clone(user2);
                                                  });
                                                } else {
                                                  showSnackBar(context);
                                                }
                                              },
                                              child: Text('에브리타임 로그인',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18)),
                                              style: ElevatedButton.styleFrom(
                                                minimumSize: Size(335, 50),
                                                primary: Palette.everyRed,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50)),
                                                elevation: 0.0,
                                              )))
                                    ])))),
                        Text('아이디/비밀번호 찾기',
                            style: TextStyle(
                                color: Colors.grey.shade500, fontSize: 15)),
                        SizedBox(height: 25),
                        Text('회원가입',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
              ),
            );
          }))),
      onWillPop: () => Future.value(false),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text(
      '올바른 정보를 입력해주세요.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
  ));
}
