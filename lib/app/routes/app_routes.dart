import 'package:travo_app/app/modules/home/views/home_view.dart';
import 'package:travo_app/app/modules/splash/views/splash_view.dart';
import 'package:travo_app/app/routes/routes.dart';

class AppRoutes {
  static final routes = {
    Routes.splash: (context) => const SplashView(),
    Routes.home: (context) => const HomeView(),
  };
}
