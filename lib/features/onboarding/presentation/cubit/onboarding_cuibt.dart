import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final int pageCount;

  OnboardingCubit({required this.pageCount})
    : super(OnboardingState(currentPage: 0, btnText: "Skip"));

  void setPage(int index) {
    debugPrint("Page count:: $pageCount");
    debugPrint("OnboardingCubit -- setPage: current index is $index");

    emit(
      state.copyWith(
        currentPage: index,
        btnText: index == pageCount - 1 ? "Get Started" : "Skip",
      ),
    );
  }

  void skipToLast() {
    debugPrint("Page count:: $pageCount");

    debugPrint(
      "OnboardingCubit -- skipToLast(): current index is ${pageCount - 1}",
    );
    emit(state.copyWith(currentPage: pageCount - 1, btnText: "Get Started"));
  }
} // end of OnboardingCubit
