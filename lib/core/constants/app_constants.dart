class AppConstants {
  // Private constructor to prevent instantiation
  AppConstants._();

  // App general constants
  static const String appName = 'Finance App';
  static const String appVersion = '1.0.0';

  // API related constants
  static const String baseUrl = 'https://api.example.com';
  static const int timeoutDuration = 30; // in seconds

  // Storage keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
  static const String shpHasSeenOnboardingKey = 'has_seen_onboarding';
  static const String themeModeKey = 'theme_mode';
  static const String languageKey = 'language';

  // Error messages
  static const String generalError = 'Something went wrong';
  static const String networkError = 'Please check your internet connection';
  static const String authError = 'Authentication failed';
}
