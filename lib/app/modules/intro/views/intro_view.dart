import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travo_app/app/core/constants/app_color.dart';
import 'package:travo_app/app/modules/intro/widgets/page_intro_components.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        pageIndex = _pageController.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              PageIntroComponents(
                locationImage: Alignment.topRight,
                image: "assets/images/intro.png",
                title: "Book a flight",
                desc:
                    "Found a flight that matches your destination and schedule? Book it instantly.",
              ),
              PageIntroComponents(
                image: "assets/images/intro1.png",
                title: "Book a flight",
                desc:
                    "Found a flight that matches your destination and schedule? Book it instantly.",
              ),
              PageIntroComponents(
                locationImage: Alignment.topLeft,
                image: "assets/images/intro2.png",
                title: "Book a flight",
                desc:
                    "Found a flight that matches your destination and schedule? Book it instantly.",
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: MediaQuery.of(context).size.height * 0.15,
        child: Row(children: [
          Expanded(
              child: SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: const ExpandingDotsEffect(
                dotWidth: 5, dotHeight: 5, activeDotColor: Colors.orange),
          )),
          Expanded(
            child: ButtonIntro(context),
          )
        ]),
      ),
    );
  }

  Container ButtonIntro(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(30)),
      child: TextButton(
          onPressed: () {
            if (pageIndex == 2) {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => LoginScreen()));
            } else {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear);
            }
          },
          style: const ButtonStyle(splashFactory: NoSplash.splashFactory),
          child: pageIndex == 2
              ? Text(
                  "Get Started",
                  style: TextStyle(
                      color: AppColor.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )
              : Text(
                  "Next",
                  style: TextStyle(
                      color: AppColor.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
    );
  }
}
