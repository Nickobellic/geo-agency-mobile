import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:geo_agency_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// flutter drive  --driver=integration_test/login_web.dart  --target=integration_test/login_web_test.dart -d chrome 

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW

  testWidgets('Check whether App loads or not', (tester) async{

    await tester.pumpWidget(ProviderScope(child: MyApp())); // Launches the App

    await tester.pump(new Duration(seconds: 3));

    final usernameField = find.byKey(const Key('textField_username_web'));
    final passwordField = find.byKey(const Key('textField_password_web'));

    expect(find.text("Login (Web)"), findsOneWidget);

    expect(find.text("Username").first, findsOneWidget, reason: 'Username Label Found');
    expect(usernameField, findsOneWidget, reason: "Username Text Field Found");

    expect(find.text("Password").first, findsOneWidget, reason: 'Password Label Found');
    expect(passwordField, findsOneWidget, reason: "Password Text Field Found");

  });
}