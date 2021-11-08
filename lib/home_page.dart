import 'package:every/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_cubit.dart';
import 'MainPage.dart';
import 'ListPage.dart';
import 'AlertPage.dart';
import 'CampicPage.dart';
import 'TimePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (_, state) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                _changeBottomNav(_, index);
              },
              backgroundColor: Colors.white,
              currentIndex: state,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                    size: 28,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.space_dashboard_outlined,
                    size: 25,
                  ),
                  label: 'Time',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    size: 25,
                  ),
                  label: 'List',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.notifications_outlined,
                    size: 25,
                  ),
                  label: 'Alert',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.room_outlined, size: 25),
                  label: 'Campic',
                ),
              ],
            ),
            body: _buildBody(state),
          ),
        );
      },
    );
  }

  void _changeBottomNav(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.read<HomeCubit>().getMain();
        break;
      case 1:
        context.read<HomeCubit>().getTime();
        break;
      case 2:
        context.read<HomeCubit>().getList();
        break;
      case 3:
        context.read<HomeCubit>().getAlert();
        break;
      case 4:
        context.read<HomeCubit>().getCampic();
        break;
    }
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return MainPage();
      case 1:
        return TimePage();
      case 2:
        return ListPage();
      case 3:
        return AlertPage();
      case 4:
        return CampicPage();
      default:
        return MainPage();
    }
  }
}
