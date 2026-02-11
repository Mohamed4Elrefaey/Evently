import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/core/reusable/Custome_button.dart';
import 'package:evently/ui/login_screen/LoginScreen.dart';
import 'package:evently/ui/onboarding/data/onboardingItems.dart';
import 'package:evently/ui/onboarding/widgets/ContentPage.dart';
import 'package:evently/ui/onboarding/widgets/Indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "Onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  final controller = OnboardingItems();
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController();
    super.initState();
  }

  void nextPage() {
    if (currentIndex < controller.onboardingItems.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  currentIndex > 0
                      ? InkWell(
                          onTap: () {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondaryContainer,
                              ),
                            ),
                            width: 32,
                            height: 32,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                EasyLocalization.of(
                                          context,
                                        )!.locale.languageCode ==
                                        'ar'
                                    ? AssetsManager.arrowRight
                                    : AssetsManager.arrowBack,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.onSurface,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(width: 32),
                  Spacer(flex: 2),
                  Image.asset(
                    AssetsManager.logo,
                    height: 27,
                    fit: BoxFit.fitHeight,
                  ),
                  Spacer(flex: 1),
                  currentIndex < controller.onboardingItems.length - 1
                      ? InkWell(
                          onTap: () {
                            // do not forget to handle it to navigate to login screen
                            Navigator.pushReplacementNamed(
                              context,
                              LoginScreen.routeName,
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSecondaryContainer,
                              ),
                            ),
                            width: 65,
                            height: 32,
                            child: Text(
                              StringsManager.skip.tr(),
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        )
                      : SizedBox(width: 65),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  controller: _pageController,
                  itemCount: controller.onboardingItems.length,
                  itemBuilder: (context, index) =>
                      ContentPage(model: controller.onboardingItems[index]),
                ),
              ),
              SizedBox(height: 16),
              Indicator(pageController: _pageController),
              SizedBox(height: 16),
              Text(
                controller.onboardingItems[currentIndex].title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              Expanded(
                child: Text(
                  controller.onboardingItems[currentIndex].content,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Container(
                height: 48,
                width: double.infinity,
                child: CustomeButton(
                  text: currentIndex < 2
                      ? StringsManager.nextBtn
                      : StringsManager.getStartedBtn,
                  onclick: nextPage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }
}
