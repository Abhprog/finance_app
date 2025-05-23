import 'package:flutter/material.dart'
    show
        AppBar,
        BottomNavigationBar,
        BuildContext,
        Center,
        FloatingActionButton,
        SafeArea,
        Scaffold,
        StatelessWidget,
        Widget;

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final BottomNavigationBar? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;

  const CustomScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: SafeArea(child: Center(child: body)),
    );
  }
}
