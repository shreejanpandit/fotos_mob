import 'package:flutter/material.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/branding/images/camera2.gif",
                height: 200,
                width: 300,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ));
  }
}
