import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "./view/login_mob.dart";

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
    return const MaterialApp(
      home: LoginMobile(),
    );
  }
}