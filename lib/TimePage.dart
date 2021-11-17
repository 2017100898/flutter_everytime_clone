import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'color.dart';

class TimePage extends StatefulWidget {
  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  List friends = ["고양이1", "고양이2", "고양이3", "고양이4", "고양이5"];

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
                    '2021년 2학기',
                    style: TextStyle(color: Palette.everyRed, fontSize: 13),
                  ),
                  Text(
                    '시간표 🍒',
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
                      MaterialPageRoute(builder: (context) => TimePage()));
                },
                icon: Icon(Icons.add_box_outlined),
                color: Colors.black,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TimePage()));
                },
                icon: Icon(Icons.settings_outlined),
                color: Colors.black,
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TimePage()));
                    },
                    icon: Icon(Icons.list),
                    color: Colors.black,
                  ))
            ],
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 400,
                          margin: EdgeInsets.fromLTRB(15, 5, 15, 0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myTable(
                                "월",
                                Colors.grey.shade300,
                              ),
                              myTable(
                                "화",
                                Colors.grey.shade300,
                              ),
                              myTable(
                                "수",
                                Colors.grey.shade300,
                              ),
                              myTable(
                                "목",
                                Colors.grey.shade300,
                              ),
                              myTable(
                                "금",
                                Colors.white,
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            height: 60 + 60.0 * friends.length,
                            width: 400,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Text('친구 시간표',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(210, 0, 0, 0),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TimePage()));
                                        },
                                        icon: Icon(Icons.add_box_outlined),
                                        color: Colors.black,
                                      ),
                                    )
                                  ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  friendName(friends[0]),
                                  friendName(friends[1]),
                                  friendName(friends[2]),
                                  friendName(friends[3]),
                                  friendName(friends[4]),
                                ])),
                        Container(
                            margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                            height: 150,
                            width: 400,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('학점계산기',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold)),
                                        Container(
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TimePage()));
                                            },
                                            icon: Icon(Icons.edit_outlined),
                                            color: Colors.black,
                                          ),
                                        )
                                      ]),
                                  TextButton(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "평균 학점  ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17.0),
                                            ),
                                            Text(
                                              "4.3",
                                              style: TextStyle(
                                                  color: Palette.everyRed,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.0),
                                            ),
                                            Text(
                                              " / 4.3",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15.0),
                                            ),
                                            Text(
                                              "     취득 학점  ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17.0),
                                            ),
                                            Text(
                                              "140",
                                              style: TextStyle(
                                                  color: Palette.everyRed,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.0),
                                            ),
                                            Text(
                                              " / 140",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15.0),
                                            ),
                                          ]),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                ])),
                      ]),
                ))));
  }
}

Widget friendName(String name) {
  return TextButton(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(color: Colors.black, fontSize: 17.0),
            ),
          ]),
      onPressed: () {},
      style: TextButton.styleFrom(padding: EdgeInsets.zero));
}

Widget myTable(String week, Color col) {
  return Expanded(
    child: Table(
      border: TableBorder(
          horizontalInside: BorderSide(color: Colors.grey.shade300),
          right: BorderSide(color: col)),
      children: [
        TableRow(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            children: [
              Container(
                  height: 30.0,
                  child: Center(
                      child: Text(
                    week,
                  ))),
            ]),
        TableRow(children: [
          Container(
            height: 60.0,
          )
        ]),
        TableRow(children: [
          Container(
            height: 60.0,
          )
        ]),
        TableRow(children: [
          Container(
            height: 60.0,
          )
        ]),
        TableRow(children: [
          Container(
            height: 60.0,
          )
        ]),
        TableRow(children: [
          Container(
            height: 60.0,
          )
        ]),
        TableRow(children: [
          Container(
            height: 60.0,
          )
        ]),
      ],
    ),
  );
}
