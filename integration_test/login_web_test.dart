import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:geo_agency_mobile/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// flutter drive  --driver=integration_test/login_web.dart  --target=integration_test/login_web_test.dart -d chrome 

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW

  testWidgets('Check whether App loads or not', (tester) async{

    await tester.pumpWidget(ProviderScope(child: MyApp())); // Launches the App

    expect(find.text("Login (Web)"), findsOneWidget);

  });
}