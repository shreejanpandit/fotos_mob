import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fotos_mobile/res/typo_theme_data.dart';
import 'package:fotos_mobile/utils/routes/routes.dart';
import 'package:fotos_mobile/utils/routes/routes_name.dart';
import 'package:fotos_mobile/view_model/auth_view_model.dart';
import 'package:fotos_mobile/view_model/appbar_item_view_model.dart';
import 'package:fotos_mobile/view_model/favourite_view_model.dart';
import 'package:fotos_mobile/view_model/gerne_view_model.dart';
import 'package:fotos_mobile/view_model/home_view_model.dart';
import 'package:fotos_mobile/view_model/image_open_view_model.dart';
import 'package:fotos_mobile/view_model/image_picker_view_model.dart';
import 'package:fotos_mobile/view_model/media_view_model.dart';
import 'package:fotos_mobile/view_model/recommended_view_model.dart';
import 'package:fotos_mobile/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => AppbarViewModel()),
        ChangeNotifierProvider(create: (_) => GenersViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => ImagePickerModel()),
        ChangeNotifierProvider(create: (_) => MediaViewModel()),
        ChangeNotifierProvider(create: (_) => ImageOpenViewModel()),
        ChangeNotifierProvider(create: (_) => FavouriteViewModel()),
        ChangeNotifierProvider(create: (_) => RecommendedViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fotos',
        theme: CustomTheme.themeData,
        initialRoute: RoutesName.splash,
        // initialRoute: RoutesName.test,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
