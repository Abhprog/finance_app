import 'package:finance_app/core/routing/router_manager.dart'
    show AppRouterManager;
import 'package:flutter/material.dart'
    show
        AppBar,
        BorderRadius,
        BuildContext,
        Colors,
        Column,
        CrossAxisAlignment,
        Form,
        FormState,
        GlobalKey,
        MainAxisAlignment,
        Row,
        SizedBox,
        Spacer,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextEditingController,
        TextInputType,
        TextStyle,
        Theme,
        Widget;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart'
    show CountDownTimerFormat, TimerCountdown;
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../core/shared/widgets/account_action_text_button.dart';
import '../../../../../../core/shared/widgets/custom_scaffold.dart';
import '../../../../../../core/shared/widgets/primary_button_widget.dart';
import '../../../../../core/shared/widgets/auth_descriptive_text_widget.dart';

class OTPVerificationCodeScreen extends StatefulWidget {
  const OTPVerificationCodeScreen({super.key});

  @override
  State<OTPVerificationCodeScreen> createState() =>
      _OTPVerificationCodeScreenState();
}

class _OTPVerificationCodeScreenState extends State<OTPVerificationCodeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _pinCodeController = TextEditingController();

  void _verifyEmailAndSendCode() {
    if (_formKey.currentState!.validate()) {
      // final email = _emailController.text;
    }
  }

  late DateTime _otpEndTime;

  @override
  void initState() {
    super.initState();
    _otpEndTime = DateTime.now().add(const Duration(seconds: 60));
  }

  @override
  void dispose() {
    // _pinCodeController.dispose(); // don't dispose the controller if you want to use it later,
    // because it will be show error exception
    // when you try to use it again after disposal.
    super.dispose();
  }

  bool _isCountFinished = false;

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
              title: "OTP Verification",
              description: 'We have sent a verification code to your email',
            ),
            SizedBox(height: 10.h),

            TextFieldOTPCodeWidget(
              pinCodeController: _pinCodeController,
              otpEndTime: _otpEndTime,
            ),
            SizedBox(height: 20.h),

            PrimaryButtonWidget(
              text: 'Verify',
              onPressed: _verifyEmailAndSendCode,
            ),
            Spacer(),

            _isCountFinished
                ? AccountTextActionButton(
                  text: "Didn't recieve code?",
                  actionText: "Resend",
                  onPressed: () => AppRouterManager.pop(context),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Resend code in ', style: TextStyle(fontSize: 16.sp)),
                    TimerCountdown(
                      format: CountDownTimerFormat.secondsOnly,
                      timeTextStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 30.sp,
                      ),
                      endTime: DateTime.now().add(Duration(seconds: 60)),
                      enableDescriptions: false,
                      onEnd: () {
                        if (mounted) {
                          _isCountFinished = true;
                        }
                      },
                    ),
                    Text(' seconds.', style: TextStyle(fontSize: 16.sp)),
                  ],
                ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class TextFieldOTPCodeWidget extends StatelessWidget {
  final TextEditingController pinCodeController;
  final DateTime otpEndTime;
  const TextFieldOTPCodeWidget({
    super.key,
    required this.pinCodeController,
    required this.otpEndTime,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return PinCodeTextField(
      appContext: context,
      length: 5,
      controller: pinCodeController,
      backgroundColor: Colors.transparent,
      keyboardType: TextInputType.number,
      cursorColor: theme.primary,
      enableActiveFill: true,
      pinTheme: PinTheme(
        selectedFillColor: theme.primary.withAlpha(20),
        activeFillColor: theme.primary.withAlpha(20),
        inactiveFillColor: theme.primary.withAlpha(20),
        inactiveColor: Colors.grey,
        activeColor: Colors.grey,
        selectedColor: Theme.of(context).colorScheme.primary,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        borderWidth: 1,
        fieldWidth: 60.w,
        fieldHeight: 60.w,
      ),
      dialogConfig: DialogConfig(
        dialogTitle: 'Paste OTP',
        affirmativeText: 'OK',
        negativeText: 'Cancel',
        dialogContent: 'Do you want to paste copied OTP ',
        platform: PinCodePlatform.other,
      ),
    );
  }
}
