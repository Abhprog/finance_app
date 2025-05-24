import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Colors,
        Container,
        EdgeInsets,
        Padding,
        PageController,
        StatelessWidget,
        Theme,
        Widget,
        debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    show SmoothPageIndicator, WormEffect;

import '../../data/onboarding_data_model.dart' show OnBoardingItemData;
import '../cubit/onboarding_cuibt.dart';
import '../cubit/onboarding_state.dart';

class SmoothPageDotsIndicatorWidget extends StatelessWidget {
  const SmoothPageDotsIndicatorWidget({
    super.key,
    required this.onBoardingItemData,
    required PageController pageController,
  }) : _pageController = pageController;

  final List<OnBoardingItemData> onBoardingItemData;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final onboardingCubit = context.read<OnboardingCubit>();
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withAlpha(100),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SmoothPageIndicator(
              count: onBoardingItemData.length,
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.white,
                dotColor: Colors.white12,
              ),
              controller: _pageController, // Dummy controller
              onDotClicked: (index) {
                debugPrint("dot index is: $index");
                onboardingCubit.setPage(index);
                _pageController.jumpToPage(index);
              }, // No-op because ConcentricPageView doesn't support controller
            ),
          );
        },
      ),
    );
  }
}
