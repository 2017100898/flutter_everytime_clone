import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CampicPage extends StatefulWidget {
  @override
  State<CampicPage> createState() => _CampicPageState();
}

class _CampicPageState extends State<CampicPage> {
  var download;

  @override
  void initState() {
    download = 0;
    super.initState();
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
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 10),
                  Text(
                    '대학생 SNS',
                    style:
                        TextStyle(color: Colors.lightBlueAccent, fontSize: 13),
                  ),
                  Text(
                    '캠퍼스픽',
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
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CampicPage()));
                  },
                  icon: Icon(Icons.message),
                  color: Colors.lightBlueAccent,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(children: [
                    Visibility(
                      visible: download == 0 ? true : false,
                      child: Container(
                          margin: EdgeInsets.all(10),
                          height: 135,
                          width: 380,
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '동아리, 공모전, 대외활동, 스터디 등\n즐겁고 유익한 정보가 한 곳에!',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      download = 1;
                                    });
                                  },
                                  child: Text(' 앱 설치하기 ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.lightBlueAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    elevation: 0.0,
                                  ))
                            ],
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      height: 220,
                      width: 400,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              recLink(Icons.people, "동아리"),
                              recLink(Icons.people, "대외활동"),
                              recLink(Icons.people, "공모전"),
                              recLink(Icons.people, "스터디"),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              recLink(Icons.people, "취업정보"),
                              recLink(Icons.people, "이벤트"),
                              recLink(Icons.people, "커뮤니티"),
                              recLink(Icons.people, "게시요청"),
                            ]),
                      ]),
                    ),
                    Container(
                      width: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              child: Text('지금 인기 있는 글',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              popularAd(
                                  1, '[국립중앙도서관] 1인 미디어\n아카데미 콘텐츠 제작 지원', '공모전'),
                              popularAd(2, '영화 <나를 잡아줘> 예매권\n이벤트 진행중', '이벤트'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              popularAd(3, '그_냥 단독 콘서트 초대\n이벤트 진행중', '이벤트'),
                              popularAd(0, '2021 의료데이터 인공지능\n해커톤 공모전', '공모전'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              popularAd(0, '2021 의료데이터 인공지능\n해커톤 공모전', '공모전'),
                              popularAd(0, '2021 의료데이터 인공지능\n해커톤 공모전', '공모전'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              popularAd(0, '2021 의료데이터 인공지능\n해커톤 공모전', '공모전'),
                              popularAd(0, '2021 의료데이터 인공지능\n해커톤 공모전', '공모전'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ]),
                ))));
  }
}

Widget recLink(IconData icon, String First) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(5, 10, 0, 10),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.lightBlue.shade50,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            icon,
            color: Colors.blue.shade300,
          ),
        ),
        Text(First),
      ],
    ),
  );
}

Widget popularAd(var adNum, String title, String subject) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.fromLTRB(0, 10, 5, 10),
        height: 120,
        width: 190,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/c_ad$adNum.jpg"), fit: BoxFit.fill),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
      ),
      Row(children: [
        SizedBox(width: 3.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 16.0)),
            SizedBox(
              height: 3,
            ),
            Text(subject,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent)),
          ],
        )
      ]),
    ]),
  );
}
