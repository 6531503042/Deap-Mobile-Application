import 'package:dentist_appointment/models/onboarding_contents.dart';
import 'package:dentist_appointment/screens/AuthPage.dart';
import 'package:flutter/material.dart';
import '../utils/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;
  late SharedPreferences _prefs;
  late bool _showOnboarding;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _showOnboarding = _prefs.getBool('showOnboarding') ?? true;
    setState(() {}); // Rebuild UI after prefs are loaded
  }

  int _currentPage = 0;
  List<Color> colors = const [
    Color.fromRGBO(248, 246, 244, 1),
    Color.fromRGBO(227, 244, 244, 1),
    Color.fromRGBO(196, 223, 223, 1),
  ];

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Color(0xFF000000),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    if (!_showOnboarding) {
      return const AuthPage();
    }

    return Scaffold(
      backgroundColor: colors[_currentPage],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.1,
                      vertical: height * 0.05,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: height * 0.35,
                        ),
                        SizedBox(height: height * 0.05),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w600,
                            fontSize: (width <= 550) ? 24 : 28,
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          contents[i].desc,
                          style: TextStyle(
                            fontFamily: "Mulish",
                            fontWeight: FontWeight.w300,
                            fontSize: (width <= 550) ? 14 : 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (int index) => _buildDots(index: index),
                    ),
                  ),
                  _currentPage + 1 == contents.length
                      ? Padding(
                          padding: EdgeInsets.all(width * 0.05),
                          child: ElevatedButton(
                            onPressed: () async {
                              // Set onboarding to completed
                              await _prefs.setBool('showOnboarding', false);
                              Navigator.pushReplacementNamed(context, '/auth');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 23, 224, 157),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.1,
                                vertical: height * 0.02,
                              ),
                              textStyle: TextStyle(
                                fontSize: (width <= 550) ? 14 : 18,
                              ),
                            ),
                            child: const Text("START"),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                style: TextButton.styleFrom(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: (width <= 550) ? 14 : 18,
                                  ),
                                ),
                                child: const Text(
                                  "SKIP",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 23, 224, 157)),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 23, 224, 157),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05,
                                    vertical: height * 0.02,
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: (width <= 550) ? 14 : 18,
                                  ),
                                ),
                                child: const Text("NEXT"),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
