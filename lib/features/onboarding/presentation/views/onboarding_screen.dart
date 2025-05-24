import 'package:flutter/material.dart'
    show
        Alignment,
        AppBar,
        AssetImage,
        BuildContext,
        Color,
        Colors,
        PageController,
        Stack,
        State,
        StatefulWidget,
        Text,
        Widget;

import '../../../../../core/shared/widgets/custom_scaffold.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_constants.dart' show AppConstants;
import '../../../../core/routing/app_routes.dart';
import '../../../../core/routing/router_manager.dart';
import '../../../../core/services/local_storage_prefs_manager.dart'
    show LocalStoragePrefsManager;
import '../../data/onboarding_data_model.dart' show OnBoardingItemData;
import '../widgets/custom_concentric_page_view_widget.dart'
    show CustomConcentricPageViewWidget;
import '../widgets/on_boarding_text_button_widget.dart'
    show OnBoardingTextButtonWidget;
import '../widgets/smooth_page_dots_indicator.dart'
    show SmoothPageDotsIndicatorWidget;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  late List<OnBoardingItemData> onBoardingData;

  @override
  void initState() {
    super.initState();
    _initPageController();
    _checkFirstTime();

    onBoardingData = initOnBoardingData();
  }

  Future<void> _checkFirstTime() async {
    final prefs = await LocalStoragePrefsManager.init();
    final hasSeenOnboarding =
        prefs.getBool(AppConstants.shpHasSeenOnboardingKey) ?? false;
    if (hasSeenOnboarding) {
      if (mounted) {
        AppRouterManager.go(context, AppRoutes.home);
      }
    }
  }

  void _initPageController() {
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 0.8,
    );
  }

  List<OnBoardingItemData> initOnBoardingData() {
    return [
      OnBoardingItemData(
        title: "Track Your Finances",
        subtitle: "Keep track of your income and expenses easily.",
        image: const AssetImage(AppAssets.assetsImagesImage1),
        backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
        titleColor: Colors.amber,
        subtitleColor: Colors.white,
      ),
      OnBoardingItemData(
        title: "Smart Budgeting",
        subtitle: "Set and manage budgets to reach your financial goals.",
        image: const AssetImage(AppAssets.assetsImagesImage2),
        backgroundColor: Colors.white,
        titleColor: Colors.purple,
        subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      ),
      OnBoardingItemData(
        title: "Investment Insights",
        subtitle: "Get valuable insights for better investment decisions.",
        image: const AssetImage(AppAssets.assetsImagesImage3),
        backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
        titleColor: Colors.orange.shade600,
        subtitleColor: Colors.white,
      ),
      OnBoardingItemData(
        title: "Secure Transactions",
        subtitle: "Your financial data is protected with advanced security.",
        image: const AssetImage(AppAssets.assetsImagesImage4),
        backgroundColor: Colors.white,
        titleColor: Colors.red.shade400,
        subtitleColor: Colors.black,
      ),
    ];
  }

  @override
  void dispose() {
    super.dispose();
    // _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(title: Text("Onboarding")),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomConcentricPageViewWidget(
            onBoardingData: onBoardingData,
            pageController: _pageController,
          ),
          SmoothPageDotsIndicatorWidget(
            onBoardingItemData: onBoardingData,
            pageController: _pageController,
          ),
          OnBoardingTextButtonWidget(pageController: _pageController),
        ],
      ),
    );
  }
}
