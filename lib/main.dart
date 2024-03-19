import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geo_agency_mobile/view/web_widgets/login_web.dart';
import 'view/android_widgets/login_mob.dart';

void main() {
  runApp(
    ProviderScope(  // Wrap MyApp() with Provider Scope to use Provider inside App
      child: MyApp()
    )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage.platformSpecificUI(context),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage {
  static Widget platformSpecificUI(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return const LoginMobile(); // Mobile Widget
    } else {
      return const LoginWeb(); // Web Widget
    }
  }
}