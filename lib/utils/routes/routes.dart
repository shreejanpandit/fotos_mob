import 'package:flutter/material.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/view/auth/forget_password_view.dart';
import 'package:fotos_mobile/view/drawer_items/about_us_view.dart';
import 'package:fotos_mobile/view/drawer_items/privacy_view.dart';
import 'package:fotos_mobile/view/home/home_screen.dart';
import 'package:fotos_mobile/view/auth/login_view.dart';
import 'package:fotos_mobile/view/auth/signup_view.dart';
import 'package:fotos_mobile/view/profile/profile_screen.dart';
import 'package:fotos_mobile/view/splash_view.dart';
import 'package:fotos_mobile/view/drawer_items/terms_and_condition_view.dart';

import '../../test.dart';
import '../../view/home/image_open_screen.dart';
import '../../view/home/search_result_screen.dart';
import '../../view/profile/collection_screen.dart';
import '../../view/profile/edit_profile_screen.dart';
import '../../view/profile/favourite_screen.dart';
import '../../view/profile/media/media_screen.dart';
import '../../view/profile/message/message_screen.dart';
import '../../view/profile/message/user_mesage.dart';
import '../../view/profile/payment/add_payment_screen.dart';
import '../../view/profile/payment/choose_payment_method.dart';
import '../../view/profile/payment/payment_details.dart';
import '../../view/profile/payment/payment_screen.dart';
import '../../view/profile/user_profile_screen.dart';

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
            builder: ((BuildContext context) =>
                const TermsAndConditionsPage()));
      case RoutesName.privacy:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const PrivacyPage()));
      case RoutesName.about_us:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const AboutUsPage()));
      case RoutesName.user_profile_edit:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const EditUserProfileScreen()));

      case RoutesName.user_profile:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const UserProfileScreen()));

      case RoutesName.payment:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const PaymentScreen()));
      case RoutesName.profile:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const ProfileScreen()));
      case RoutesName.message:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const MessagesScreen()));
      case RoutesName.media:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const MediaScreen()),
            settings: settings);
      case RoutesName.collection:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const CollectionScreen()));
      case RoutesName.favourite:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const FavouriteScreen()));
      case RoutesName.add_payment:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const AddPaymentScreen()));
      case RoutesName.payment_detail:
        int selectedIndex = 0; // Initialize selectedIndex with a default value
        return MaterialPageRoute(
          builder: (BuildContext context) => PaymentDetailScreen(
            selectedIndex: selectedIndex,
          ),
        );

      case RoutesName.select_payment:
        return MaterialPageRoute(
            builder: ((
          BuildContext context,
        ) =>
                const ChoosePaymentMethod()));

      case RoutesName.user_msg:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const UserMessagesScreen()));
      case RoutesName.image_open:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const ImageOpenScreen()));
      case RoutesName.search_result:
        return MaterialPageRoute(
            builder: ((BuildContext context) => const SearchResultPage()));

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
