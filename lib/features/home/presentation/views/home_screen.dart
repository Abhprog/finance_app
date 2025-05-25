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
        IndexedStack,
        Key,
        MainAxisAlignment,
        SizedBox,
        StatelessWidget,
        Text,
        Theme,
        Widget;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/widgets/custom_scaffold.dart';
import '../../../../core/shared/widgets/primary_button_widget.dart';
import '../../../../core/shared/widgets/outlined_primary_button.dart';
import '../cubit/home_cubit.dart' show HomeCubit, HomeState;

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({super.key, required this.title});

  final List<Widget> screens = [
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.teal,
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

  var tabItems = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeCubit = context.read<HomeCubit>();
        return CustomScaffold(
          appBar: AppBar(title: Text(title)),
          bottomNavigationBar: BottomNavigationBar(
            key: const Key('bottom_navigation_bar'),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            currentIndex: state.index,
            onTap: (newIndex) => homeCubit.setTabIndex(newIndex),
            items: tabItems,
          ),
          body: IndexedStack(index: state.index, children: screens),
        );
      },
    );
  }
}
