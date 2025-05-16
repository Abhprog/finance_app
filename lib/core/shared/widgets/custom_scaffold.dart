import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Center,
        EdgeInsets,
        Padding,
        SafeArea,
        Scaffold,
        StatelessWidget,
        Widget;

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;

  const CustomScaffold({super.key, required this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(child: body),
        ),
      ),
    );
  }
}
