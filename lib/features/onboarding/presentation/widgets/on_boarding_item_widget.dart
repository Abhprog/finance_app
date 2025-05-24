import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Column,
        EdgeInsets,
        Flexible,
        FontWeight,
        Image,
        MainAxisAlignment,
        Padding,
        Spacer,
        Stack,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;

import '../../data/onboarding_data_model.dart' show OnBoardingItemData;

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({required this.data, super.key});

  final OnBoardingItemData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                Flexible(flex: 20, child: Image(image: data.image)),
                const Spacer(flex: 1),
                Text(
                  data.title,
                  style: TextStyle(
                    color: data.titleColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                  maxLines: 1,
                ),
                const Spacer(flex: 1),
                Text(
                  data.subtitle,
                  style: TextStyle(color: data.subtitleColor, fontSize: 20),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                const Spacer(flex: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
