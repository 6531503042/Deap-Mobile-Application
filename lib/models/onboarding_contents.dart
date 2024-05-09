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
    title: "Welcome to your Dentist Appointment Application",
    image: "assets/images-2.png",
    desc: "This application make you esier to see your dentist.",
  ),
  OnboardingContents(
    title: "Make your oral health better",
    image: "assets/verify.png",
    desc:
        "When you have oral health problems,just book an appointment with the doctor.",
  ),
  OnboardingContents(
    title: "Let's book your appointment",
    image: "assets/Banner Animate copy.png",
    desc:
        "Have a good time with our application and have a good oral health.",
  ),
];
