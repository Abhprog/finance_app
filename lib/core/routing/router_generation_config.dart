import 'package:finance_app/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:go_router/go_router.dart';

import '../../features/auth/forgot_password/presentation/views/forgot_password.dart';
import '../../features/auth/login/presentation/views/login_screen.dart';
import '../../features/auth/otp_verification/presentation/views/otp_verification_screen.dart';
import '../../features/auth/signup/presentation/views/signup_screen.dart';
import '../../features/home/presentation/cubit/home_cubit.dart'
    show HomeCubit, HomeState;
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/onboarding/presentation/cubit/onboarding_cuibt.dart';
import 'app_routes.dart';

// Import your screens/pages here
// import '../screens/home_screen.dart';
// import '../screens/login_screen.dart';
// import '../screens/profile_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder:
          (context, state) => BlocProvider(
            create: (_) => OnboardingCubit(pageCount: 4),
            child: const OnBoardingScreen(),
          ),
    ),

    GoRoute(
      path: AppRoutes.home,
      builder:
          (context, state) => BlocProvider(
            create: (context) => HomeCubit(HomeState(index: 0)),
            child: HomeScreen(title: 'Home Screen'),
          ),
      // routes: [
      //   GoRoute(path: 'profile', builder: (context, state) => ProfileScreen()),
      // ],
    ),
    GoRoute(path: AppRoutes.login, builder: (context, state) => LoginScreen()),
    GoRoute(
      path: AppRoutes.signup,
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.otpCodeVerification,
      builder: (context, state) => OTPVerificationCodeScreen(),
    ),
    // GoRoute(
    //   path: AppRoutes.settings,
    // builder: (context, state) => SettingsScreen(),
    // ),
  ],
);
