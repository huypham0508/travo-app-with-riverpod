import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(FlutterI18n.translate(context, "home.test")),
      ),
    );
  }
}
