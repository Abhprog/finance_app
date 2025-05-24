import 'package:finance_app/core/services/local_storage_prefs_manager.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        FontWeight,
        FutureBuilder,
        PageController,
        Positioned,
        StatelessWidget,
        Text,
        TextButton,
        TextStyle,
        Widget,
        debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_constants.dart' show AppConstants;
import '../../../../core/routing/app_routes.dart';
import '../../../../core/routing/router_manager.dart' show AppRouterManager;
import '../cubit/onboarding_cuibt.dart' show OnboardingCubit;
import '../cubit/onboarding_state.dart' show OnboardingState;

class OnBoardingTextButtonWidget extends StatelessWidget {
  const OnBoardingTextButtonWidget({
    super.key,
    required PageController pageController,
  }) : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LocalStoragePrefsManager.init(),
      builder: (context, snapshot) {
        // if (!snapshot.hasData) {
        //   return const SizedBox.shrink();
        // }
        final sharedPrefs = snapshot.data;

        return Positioned(
          right: 10.w,
          bottom: 30.h,
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              final onboardingCubit = context.read<OnboardingCubit>();
              final lastPageIndex = onboardingCubit.pageCount - 1;
              final btnTxt = state.btnText;
              return TextButton(
                onPressed: () {
                  final currentPageIndex = state.currentPage;
                  if (currentPageIndex == lastPageIndex) {
                    AppRouterManager.go(context, AppRoutes.home);
                    sharedPrefs!.setBool(
                      AppConstants.shpHasSeenOnboardingKey,
                      true,
                    );
                    debugPrint("Onboarding completed, navigating to home");
                    debugPrint("Finished");
                    // return;
                  }
                  // onboardingCubit.skipToLast();
                  _pageController.jumpToPage(lastPageIndex);
                },
                child: Text(
                  btnTxt,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
