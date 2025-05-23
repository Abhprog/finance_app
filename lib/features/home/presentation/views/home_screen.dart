import 'package:flutter/material.dart'
    show
        AppBar,
        BottomNavigationBar,
        BottomNavigationBarItem,
        BottomNavigationBarType,
        BuildContext,
        Colors,
        Column,
        Container,
        Icon,
        Icons,
        MainAxisAlignment,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        Theme,
        Widget;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/widgets/custom_scaffold.dart';
import '../../../../core/shared/widgets/primary_button_widget.dart';
import '../../../../core/shared/widgets/outlined_primary_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> screens = [
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue,
      child: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PrimaryButtonWidget(text: 'Login', onPressed: () {}),
          const SizedBox(height: 10),
          PrimaryOutlinedButtonWidget(text: 'Sign Up', onPressed: () {}),
          const SizedBox(height: 10),
        ],
      ),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.purple,
      child: Text('Statistics'),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.red,
      child: Text('Search'),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.green,
      child: Text('Cart'),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: Text(widget.title)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        elevation: 1,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded, size: 30.sp),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded, size: 30.sp),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded, size: 30.sp),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded, size: 30.sp),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30.sp),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[_currentIndex],
    );
  }
}
