import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  var alarm;
  late TextEditingController _controllerA;

  @override
  void initState() {
    alarm = 1;
    _controllerA = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerA.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                top: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Column(children: [
                      Text(
                        "게시판",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: alarm == 1 ? Colors.black : Colors.grey),
                      ),
                      Container(
                          width: 60.0,
                          height: 2,
                          color: alarm == 1 ? Colors.black : Colors.white)
                    ]),
                    onTap: () {
                      setState(() {
                        alarm = 1;
                      });
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: Column(children: [
                      Text(
                        "진로",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: alarm == 2 ? Colors.black : Colors.grey),
                      ),
                      Container(
                          width: 44.0,
                          height: 2,
                          color: alarm == 2 ? Colors.black : Colors.white)
                    ]),
                    onTap: () {
                      setState(() {
                        alarm = 2;
                      });
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: Column(children: [
                      Text(
                        "홍보",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: alarm == 3 ? Colors.black : Colors.grey),
                      ),
                      Container(
                          width: 44.0,
                          height: 2,
                          color: alarm == 3 ? Colors.black : Colors.white)
                    ]),
                    onTap: () {
                      setState(() {
                        alarm = 3;
                      });
                    },
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: Column(children: [
                      Text(
                        "단체",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: alarm == 4 ? Colors.black : Colors.grey),
                      ),
                      Container(
                          width: 44.0,
                          height: 2,
                          color: alarm == 4 ? Colors.black : Colors.white)
                    ]),
                    onTap: () {
                      setState(() {
                        alarm = 4;
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
            child: Center(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SafeArea(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
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
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          postList("내가 쓴 글", "mypost"),
                                          postList("댓글 단 글", "comment"),
                                          postList("스크랩", "star"),
                                          postList("HOT 게시판", "hot"),
                                          postList("BEST 게시판", "best"),
                                        ]),
                                  )),
                            ),
                          ),
                          SafeArea(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
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
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          postList("자유게시판", "pick"),
                                          postList("장터게시판", "pick"),
                                          postList("정보게시판", "pick"),
                                          postList("새내기게시판", "unpick"),
                                          postList("시사・이슈", "unpick"),
                                        ]),
                                  )),
                            ),
                          ),
                          SafeArea(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, bottom: 5.0),
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
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          postList("오늘의 학식", "lunch"),
                                          postList("강의평가", "evaluation"),
                                          postList("스터디", "study"),
                                          postList("책방", "books"),
                                        ]),
                                  )),
                            ),
                          ),
                          Container(
                            height: 45.0,
                            width: 400.0,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: Colors.grey.shade200, width: 1),
                            ),
                            child: TextField(
                              controller: _controllerA,
                              cursorColor: Colors.grey,
                              textInputAction: TextInputAction.search,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {},
                                    iconSize: 24.0,
                                    color: Colors.grey.shade400,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200,
                                          width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Colors.grey.shade200,
                                          width: 2)),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  hintText: '다른 게시판을 검색해보세요',
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                  )),
                              onSubmitted: (String value) async {
                                await showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog();
                                  },
                                );
                              },
                            ),
                          ),
                        ])))));
  }
}

Widget postList(String title, String icon) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
          height: 27,
          width: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$icon.jpg"), fit: BoxFit.fill),
          )),
      SizedBox(width: 15),
      Text(title,
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.black, fontSize: 15.0)),
    ],
  );
}
