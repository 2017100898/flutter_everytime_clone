import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_page.dart';
import 'home_cubit.dart';
import 'login.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Everytime',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        routes: {
          '/': (context) => new Login(),
          '/start': (context) {
            return new BlocProvider(
                create: (_) => HomeCubit(), child: HomePage());
          }
        });
  }
}
