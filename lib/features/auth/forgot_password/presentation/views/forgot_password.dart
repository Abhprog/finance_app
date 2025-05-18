import 'package:finance_app/core/routing/router_manager.dart'
    show AppRouterManager;
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Column,
        CrossAxisAlignment,
        Form,
        FormState,
        GlobalKey,
        MainAxisAlignment,
        SizedBox,
        Spacer,
        State,
        StatefulWidget,
        Text,
        TextAlign,
        TextEditingController,
        TextInputType,
        Theme,
        Widget;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/shared/widgets/account_action_text_button.dart';
import '../../../../../../core/shared/widgets/custom_scaffold.dart';
import '../../../../../../core/shared/widgets/primary_button_widget.dart';
import '../../../../../../core/shared/widgets/text_field_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _SignupnScreenState();
}

class _SignupnScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _verifyEmailAndSendCode() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            Text(
              "Enter email linked to your account to reset your password.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 20.h),
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

            SizedBox(height: 10.h),
            PrimaryButtonWidget(
              text: 'Check',
              onPressed: _verifyEmailAndSendCode,
            ),
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
