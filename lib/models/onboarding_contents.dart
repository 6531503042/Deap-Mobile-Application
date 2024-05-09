class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Track Your work and get the result",
    image: "assets/images-2.png",
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnboardingContents(
    title: "Stay organized with team",
    image: "assets/verify.png",
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnboardingContents(
    title: "Get notified when work happens",
    image: "assets/Banner Animate copy.png",
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
