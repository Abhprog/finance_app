import 'package:finance_app/core/routing/app_routes.dart';
import 'package:finance_app/core/routing/router_manager.dart'
    show AppRouterManager;
import 'package:finance_app/core/shared/widgets/auth_descriptive_text_widget.dart';
import 'package:finance_app/core/utils/validation_util.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Column,
        CrossAxisAlignment,
        Form,
        FormState,
        GlobalKey,
        Icons,
        MainAxisAlignment,
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
      AppRouterManager.push(
        context,
        AppRoutes.otpCodeVerification,
        extra: email,
      );
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
            AuthDescriptiveTextWidget(
              title: 'Forgot Password?',
              description:
                  'Enter email linked to your account to reset your password.',
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              controller: _emailController,
              textFieldType: TextInputType.emailAddress,
              prefixIcon: Icons.alternate_email_outlined,
              hintText: 'Email',
              onChanged: (val) {},
              validator: ValidationUtils.validateEmail,
            ),
            SizedBox(height: 20.h),
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
