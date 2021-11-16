import 'package:flutter/widgets.dart';
import 'app.dart';

class User {
  String id;
  String password;
  String name;
  String nickname;
  String school;
  String stunum;

  User(this.id, this.password, this.name, this.nickname, this.school,
      this.stunum);

  User.clone(User user)
      : this(user.id, user.password, user.name, user.nickname, user.school,
            user.stunum);

  setId(String id) {
    this.id = id;
  }

  setPassword(String password) {
    this.password = password;
  }

  setName(String name) {
    this.name = name;
  }

  setNickname(String nickname) {
    this.nickname = nickname;
  }
}
