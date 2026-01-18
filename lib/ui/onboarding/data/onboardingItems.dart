import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/models/OnboardingModel.dart';

class OnboardingItems {
  List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      image: AssetsManager.onboarding1,
      title: StringsManager.onboardingTitle1,
      content: StringsManager.onboardingContent1,
    ),

    OnboardingModel(
      image: AssetsManager.onboarding2,
      title: StringsManager.onboardingTitle2,
      content: StringsManager.onboardingContent2,
    ),

    OnboardingModel(
      image: AssetsManager.onboarding3,
      title: StringsManager.onboardingTitle3,
      content: StringsManager.onboardingContent3,
    ),
  ];
}
