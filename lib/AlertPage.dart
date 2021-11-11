import 'package:flutter/material.dart';

class AlertPage extends StatefulWidget {
  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  var stage;

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
          preferredSize: Size.fromHeight(70.0),
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
            child: Center(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [])))));
  }
}
