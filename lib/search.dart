import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'freeforum.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _controller;

  bool onSearch = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          SizedBox(height: 60),
          Center(
            child: Row(children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 40.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                ),
                child: TextField(
                  controller: _controller,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {},
                        iconSize: 24.0,
                        color: Colors.grey.shade400,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 2)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                              color: Colors.grey.shade200, width: 2)),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      hintText: '글 제목, 내용, 해시태그',
                      hintStyle: TextStyle(
                        fontSize: 18,
                      )),
                  onSubmitted: (String value) async {
                    setState(() {
                      onSearch = true;
                    });
                    await showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog();
                      },
                    );
                  },
                ),
              ),
              TextButton(
                child: Text('취소',
                    style: TextStyle(color: Colors.black54, fontSize: 18.0)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ]),
          ),
          Visibility(
            visible: onSearch ? false : true,
            child: Column(
              children: [
                SizedBox(height: 200),
                Icon(Icons.search_outlined,
                    size: 90.0, color: Colors.grey.shade400),
                Text(
                  '전체 게시판의 글을 검색해보세요',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey[500],
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ])));
  }
}
