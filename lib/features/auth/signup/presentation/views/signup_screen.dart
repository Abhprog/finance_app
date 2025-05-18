import 'package:finance_app/core/routing/router_manager.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Column,
        CrossAxisAlignment,
        Form,
        FormState,
        GlobalKey,
        SizedBox,
        Spacer,
        State,
        StatefulWidget,
        TextEditingController,
        TextInputType,
        Widget;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/shared/widgets/account_action_text_button.dart';
import '../../../../../../core/shared/widgets/custom_scaffold.dart';
import '../../../../../../core/shared/widgets/headline_text_widget.dart';
import '../../../../../../core/shared/widgets/primary_button_widget.dart';
import '../../../../../../core/shared/widgets/text_field_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupnScreenState();
}

class _SignupnScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  void _signup() {
    if (_formKey.currentState!.validate()) {
      // final firstName = _firstNameController.text;
      // final lastName = _lastNameController.text;
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      // TODO: Replace with your actual login logic
      print('Logging in with: $email | $password');
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            HeadlineTextWidget(text: "Sign Up"),
            SizedBox(height: 40.h),
            CustomTextField(
              controller: _firstNameController,
              hintText: 'First Name',
              onChanged: (val) {},
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'First Name is required';
                }
                return null;
              },
            ),
            CustomTextField(
              controller: _lastNameController,
              hintText: 'Last Name',
              onChanged: (val) {},
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Last Name is required';
                }
                return null;
              },
            ),
            CustomTextField(
              controller: _emailController,
              textFieldType: TextInputType.emailAddress,
              hintText: 'Email',
              onChanged: (val) {},
              validator: (val) {
                final emailRegex = RegExp(
                  r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}',
                );
                if (val == null || val.isEmpty) {
                  return 'Email is required';
                }
                if (!emailRegex.hasMatch(val)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            CustomTextField(
              controller: _passwordController,
              textFieldType: TextInputType.visiblePassword,
              hintText: 'Password',
              onChanged: (val) {},
              validator: (val) {
                if (val == null || val.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            CustomTextField(
              controller: _repeatPasswordController,
              textFieldType: TextInputType.visiblePassword,
              hintText: 'Repeat Password',
              onChanged: (val) {},
              validator: (val) {
                if (val == null || val.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 20.h),
            PrimaryButtonWidget(text: 'Sign Up', onPressed: _signup),
            Spacer(),

            AccountTextActionButton(
              text: "Remember Password?",
              actionText: "Login",
              onPressed: () => AppRouterManager.pop(context),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
