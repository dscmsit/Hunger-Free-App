import 'package:flutter/material.dart';
import 'package:no_hunger/utills/auth_gate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utills/route_names.dart';

class OnBoardingItem {
  late final String image;
  late final String title;
  late final String description;

  OnBoardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<OnBoardingItem> onBoardingData = [
    OnBoardingItem(
      image: 'assets/images/screen1.png',
      title: 'Welcome to Hunger Hero',
      description:
          'Join our mission to fight hunger and reduce food waste. With Hunger Hero, you can easily donate excess food and help those in need. Let\'s make a difference together.',
    ),
    OnBoardingItem(
      image: 'assets/images/screen2.png',
      title: 'How It Works',
      description:
          'With Hunger Hero, you can donate or receive food easily. Create a profile, browse available donations, or post your excess food items. Connect with your community and help fight hunger.',
    ),
    OnBoardingItem(
      image: 'assets/images/screen3.png',
      title: 'Be a Hunger Hero',
      description:
          'Your donations can make a real difference. Join the Hunger Hero community and help ensure that everyone has access to nutritious food. Together, we can end hunger and reduce food waste.',
    ),
  ];
  late PageController _pageController;
  int _currentPage = 0;
  bool _isCompleted = false;

  void _loadIsCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isCompleted = prefs.getBool('isCompleted') ?? false;
    setState(() {
      _isCompleted = isCompleted;
    });
  }

  void _markCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isCompleted', true);
    setState(() {
      _isCompleted = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadIsCompleted();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void next() {
    if (_currentPage < onBoardingData.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      setState(() {
        _currentPage++;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    if (_isCompleted) {
      return const AuthGate();
    } else {
      return Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: onBoardingData.length,
              itemBuilder: (context, index) {
                return Slider(
                    image: onBoardingData[index].image,
                    title: onBoardingData[index].title,
                    description: onBoardingData[index].description);
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: onBoardingData.length,
              effect: const ExpandingDotsEffect(
                  expansionFactor: 5, dotWidth: 20, dotHeight: 12),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    if (_currentPage == onBoardingData.length - 1) {
                      _markCompleted();
                      Navigator.pushReplacementNamed(
                          context, RouteNames.authGate);
                    } else {
                      setState(() {
                        _currentPage = onBoardingData.length - 1;
                        _pageController.jumpToPage(_currentPage);
                      });
                    }
                  },
                  child: Text(
                    _currentPage < onBoardingData.length - 1
                        ? 'Skip'
                        : 'Log In',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                FilledButton(
                  onPressed: () {
                    if (_currentPage == onBoardingData.length - 1) {
                      _markCompleted();
                      Navigator.pushReplacementNamed(
                          context, RouteNames.authGate);
                    } else {
                      next();
                    }
                  },
                  child: Text(
                    _currentPage < onBoardingData.length - 1
                        ? 'Next'
                        : 'Get Started',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ]),
      ));
    }
  }
}

class Slider extends StatelessWidget {
  String image;
  String title;
  String description;

  Slider({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(image)),
        Expanded(
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
