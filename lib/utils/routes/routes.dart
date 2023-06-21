import 'package:flutter/material.dart';
import 'package:fotos_mobile/test.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/view/auth/forget_password_view.dart';
import 'package:fotos_mobile/view/drawer_items/about_us_view.dart';
import 'package:fotos_mobile/view/drawer_items/privacy_view.dart';
import 'package:fotos_mobile/view/home/home_screen.dart';
import 'package:fotos_mobile/view/auth/login_view.dart';
import 'package:fotos_mobile/view/auth/signup_view.dart';
import 'package:fotos_mobile/view/splash_view.dart';
import 'package:fotos_mobile/view/drawer_items/terms_and_condition_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const HomeScreen()));
      case RoutesName.login:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const LogInView()));
      case RoutesName.signup:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const SignUpView()));
      case RoutesName.forget_password:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const ForgetPasswordView()));
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const SplashView()));
      case RoutesName.terms_And_condition:
        return MaterialPageRoute(
            builder: ((BuildContext context) => TermsAndConditionsPage()));
      case RoutesName.privacy:
        return MaterialPageRoute(
            builder: ((BuildContext context) => PrivacyPage()));
      case RoutesName.about_us:
        return MaterialPageRoute(
            builder: ((BuildContext context) => AboutUsPage()));
      // case RoutesName.test:
      //   return MaterialPageRoute(builder: ((BuildContext context) => Test()));
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text('No route defined')),
          );
        });
    }
  }
}
