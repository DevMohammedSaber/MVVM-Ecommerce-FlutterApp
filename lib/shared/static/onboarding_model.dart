class OnboardingModel {
  final String image, title, body;

  OnboardingModel(
      {required this.image, required this.body, required this.title});
}

List<OnboardingModel> onBoardingList = [
  OnboardingModel(
    image: 'assets/images/splash_1.png',
    title: 'Purchase Online !!',
    body:
        'You can buy everything you want from our store. Choose from among many products',
  ),
  OnboardingModel(
    image: 'assets/images/splash_2.png',
    title: 'Easy Shopping',
    body:
        'Grab your items only need to order from home. chick pay and wait for the coutier to arrive.',
  ),
  OnboardingModel(
    image: 'assets/images/splash_3.png',
    title: 'Fast Delievery',
    body:
        'Courier will send the products you pay in just 1 day. very fast like a flash!',
  ),
];
