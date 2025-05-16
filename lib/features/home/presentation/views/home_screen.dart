import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Column,
        MainAxisAlignment,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextInputType,
        Widget;

import '../../../../core/shared/widgets/custom_scaffold.dart';
import '../../../../core/shared/widgets/primary_button_widget.dart';
import '../../../../core/shared/widgets/outlined_primary_button.dart';
import '../../../../core/shared/widgets/text_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PrimaryButtonWidget(text: 'Login', onPressed: () {}),
          const SizedBox(height: 10),
          CustomOutlinedButtonWidget(text: 'Sign Up', onPressed: () {}),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'Enter email',
            onChanged: (val) {},
            validator: (val) {
              return null;
            },
          ),
          CustomTextField(
            textFieldType: TextInputType.visiblePassword,
            hintText: 'Enter password',
            onChanged: (val) {},
            validator: (val) {
              return null;
            },
          ),
        ],
      ),
    );
  }
}
