
import 'package:to_do_app/core/utils/app_assets.dart';
import 'package:to_do_app/core/utils/app_strings.dart';

class OnBoardingModel {
  final String img;
  final String title;
  final String desc;

  OnBoardingModel({required this.img, required this.title, required this.desc});
}

List<OnBoardingModel> pageViewScreen = [
  OnBoardingModel(
      img: AppAssets.onboarding1,
      title: AppStrings.onBoardingTitle1,
      desc: AppStrings.onBoardingDes1),
  OnBoardingModel(
      img: AppAssets.onboarding2,
      title: AppStrings.onBoardingTitle2,
      desc: AppStrings.onBoardingDes2),
  OnBoardingModel(
      img: AppAssets.onboarding3,
      title: AppStrings.onBoardingTitle3,
      desc: AppStrings.onBoardingDes3),
];
