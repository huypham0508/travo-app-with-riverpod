import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travo_app/app/core/constants/app_color.dart';
import 'package:travo_app/app/modules/intro/views/intro_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const IntroScreen()),
            ),
          );
        }),
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              "assets/images/splash_screen.png",
              fit: BoxFit.cover,
            )),
            Positioned.fill(
                child: Center(
              child: Text(
                "Travo",
                style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 64,
                    fontWeight: FontWeight.w700),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
