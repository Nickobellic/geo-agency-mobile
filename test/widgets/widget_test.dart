
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:geo_agency_mobile/view/web_widgets/login_web.dart";


void main() {
  testWidgets('Presence of Login Screen Widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: ProviderScope( child: LoginWeb() )));

    final userNameLabel = find.byKey(Key("username_web"));
    final passwordLabel = find.byKey(Key("password_web"));

    final usernameTextField = find.byKey(Key('textField_username_web'));
    final passwordTextField = find.byKey(Key('textField_password_web'));

    final submitButton = find.byKey(Key('textField_submit_web'));

    expect(userNameLabel, findsOneWidget, reason: "Username label found");
    expect(passwordLabel, findsOneWidget, reason: "Password label found");

    expect(usernameTextField, findsOneWidget, reason: "Username Text Field found");
    expect(passwordTextField, findsOneWidget, reason: "Password Text Field found");

    expect(submitButton, findsOneWidget, reason: "Login Button found");

  });
}
