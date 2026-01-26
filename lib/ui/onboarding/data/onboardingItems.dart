import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/resources/AssetsManager.dart';
import 'package:evently/core/resources/StringsManager.dart';
import 'package:evently/models/OnboardingModel.dart';

class OnboardingItems {
  List<OnboardingModel> onboardingItems = [
    OnboardingModel(
      image: AssetsManager.onboarding1,
      title: StringsManager.onboardingTitle1.tr(),
      content: StringsManager.onboardingContent1.tr(),
    ),

    OnboardingModel(
      image: AssetsManager.onboarding2,
      title: StringsManager.onboardingTitle2.tr(),
      content: StringsManager.onboardingContent2.tr(),
    ),

    OnboardingModel(
      image: AssetsManager.onboarding3,
      title: StringsManager.onboardingTitle3.tr(),
      content: StringsManager.onboardingContent3.tr(),
    ),
  ];
}
