import 'package:go_router/go_router.dart';

import '../../features/auth/login/presentation/views/login_screen.dart';
import 'app_routes.dart';

// Import your screens/pages here
// import '../screens/home_screen.dart';
// import '../screens/login_screen.dart';
// import '../screens/profile_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => HomeScreen(),
      builder: (context, state) => LoginScreen(),
      // routes: [
      //   GoRoute(path: 'profile', builder: (context, state) => ProfileScreen()),
      // ],
    ),
    GoRoute(path: AppRoutes.login, builder: (context, state) => LoginScreen()),
    // GoRoute(
    //   path: AppRoutes.settings,
    // builder: (context, state) => SettingsScreen(),
    // ),
  ],
);
