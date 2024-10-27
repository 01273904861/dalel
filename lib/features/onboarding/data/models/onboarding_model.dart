import 'package:dalel/core/theming/app_images.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.title, required this.body});
}

List<OnBoardingModel> onBoardingModels = [
  OnBoardingModel(
      image: AppImages.imagesOnBoarding1,
      title: 'Explore The history with \nDalel in a smart way',
      body:
          'Using our app’s history libraries \nyou can find many historical periods '),
  OnBoardingModel(
      image: AppImages.imagesOnBoarding2,
      title: 'From every place \non earth',
      body: 'A big variety of ancient places \nfrom all over the world'),
  OnBoardingModel(
      image: AppImages.imagesOnBoarding3,
      title: 'Using modern AI technology \nfor better user experience',
      body:
          'AI provide recommendations and helps\nyou to continue the search journey'),
];
