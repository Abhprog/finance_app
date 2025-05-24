class OnboardingState {
  final int currentPage;
  final String btnText;

  OnboardingState({required this.currentPage, required this.btnText});

  OnboardingState copyWith({int? currentPage, String? btnText}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      btnText: btnText ?? this.btnText,
    );
  }
}
