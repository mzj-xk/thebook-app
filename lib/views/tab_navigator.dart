import 'package:flutter/material.dart';
import 'package:thebook_app/views/community.dart';
import 'package:thebook_app/views/home.dart';
import 'package:thebook_app/views/notify.dart';
import 'package:thebook_app/views/person.dart';

List<Widget> pages = [
  const Home(),
  const Community(),
  const Notify(),
  const Person()
];

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _pageController = PageController();
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
          itemBuilder: (context, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: '首页',
              icon: Image.asset(
                'assets/btn_home_page_normal.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'assets/btn_home_page_selected.png',
                width: 20,
                height: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: '社区',
              icon: Image.asset(
                'assets/btn_community_normal.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'assets/btn_community_selected.png',
                width: 20,
                height: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: '通知',
              icon: Image.asset(
                'assets/btn_notification_normal.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'assets/btn_notification_selected.png',
                width: 20,
                height: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: '个人',
              icon: Image.asset(
                'assets/btn_mine_normal.png',
                width: 20,
                height: 20,
              ),
              activeIcon: Image.asset(
                'assets/btn_mine_selected.png',
                width: 20,
                height: 20,
              ),
            )
          ],
        ));
  }
}
