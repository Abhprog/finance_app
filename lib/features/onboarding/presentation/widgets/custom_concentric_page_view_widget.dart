import 'package:concentric_transition/page_view.dart' show ConcentricPageView;
import 'package:flutter/material.dart'
    show BuildContext, PageController, StatelessWidget, Widget, debugPrint;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

import '../../../../core/routing/app_routes.dart';
import '../../../../core/routing/router_manager.dart';
import '../../data/onboarding_data_model.dart' show OnBoardingItemData;
import '../cubit/onboarding_cuibt.dart';
import '../cubit/onboarding_state.dart';
import '../widgets/on_boarding_item_widget.dart' show OnBoardingItemWidget;

class CustomConcentricPageViewWidget extends StatelessWidget {
  const CustomConcentricPageViewWidget({
    super.key,
    required this.onBoardingData,
    required PageController pageController,
  }) : _pageController = pageController;

  final List<OnBoardingItemData> onBoardingData;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        final onboardingCubit = context.read<OnboardingCubit>();
        return ConcentricPageView(
          radius: 40,
          colors: onBoardingData.map((e) => e.backgroundColor).toList(),
          itemCount: onBoardingData.length,
          onChange: (index) => onboardingCubit.setPage(index),
          // nextButtonBuilder:
          //     (index) => const PrimaryButtonWidget(text: "Next"),
          pageController: _pageController,
          duration: Duration(milliseconds: 500),
          onFinish: () {
            debugPrint("Finish - onFinish called");
            // Navigate to home screen when the last page is reached
            // When the user clicks on the next button on the last page
            debugPrint("Navigating to home screen");
            AppRouterManager.go(context, AppRoutes.home);
          },
          itemBuilder:
              (index) => OnBoardingItemWidget(data: onBoardingData[index]),
        );
      },
    );
  }
}
