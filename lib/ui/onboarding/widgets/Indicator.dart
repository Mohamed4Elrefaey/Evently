import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Indicator extends StatelessWidget {
  final PageController pageController;

  Indicator({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SmoothPageIndicator(
        controller: pageController,
        count: 3,
        effect: ExpandingDotsEffect(
          dotHeight: 7,
          dotWidth: 9,
          dotColor: Theme.of(context).colorScheme.onTertiary,
          activeDotColor: Theme.of(context).colorScheme.primary,
          paintStyle: PaintingStyle.fill,
        ),
        onDotClicked: (index) => pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
        ),
      ),
    );
  }
}
