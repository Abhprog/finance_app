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

import '../../../core/shared/widgets/account_action_text_button.dart';
import '../../../core/shared/widgets/custom_scaffold.dart';
import '../../../core/shared/widgets/headline_text_widget.dart';
import '../../../core/shared/widgets/primary_button_widget.dart';
import '../../../core/shared/widgets/text_field_widget.dart';
import '../widgets/forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      // TODO: Replace with your actual login logic
      print('Logging in with: $email | $password');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
            HeadlineTextWidget(text: "Welcome Back Again!"),
            SizedBox(height: 40.h),
            CustomTextField(
              controller: _emailController,
              hintText: 'Enter email',
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
              hintText: 'Enter password',
              onChanged: (val) {},
              validator: (val) {
                if (val == null || val.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            ForgotPasswordTextButton(onPressed: () {}),
            SizedBox(height: 30.h),
            PrimaryButtonWidget(text: 'Login', onPressed: _login),
            Spacer(),

            AccountTextActionButton(
              text: "Don't have an account?",
              actionText: "Sign Up",
              onPressed: () {},
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
