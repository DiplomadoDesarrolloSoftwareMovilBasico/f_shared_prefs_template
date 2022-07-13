import 'package:f_shared_prefs_template/domain/use_case/authentication.dart';
import 'package:f_shared_prefs_template/ui/controllers/authentication_controller.dart';
import 'package:f_shared_prefs_template/ui/pages/authentication/login_page.dart';
import 'package:f_shared_prefs_template/ui/pages/authentication/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:mockito/mockito.dart';

class MockAuthenticationController extends GetxService
    with Mock
    implements AuthenticationController {
  @override
  Future<bool> login(user, password) {
    if (user == 'a@a.com')
      return Future.value(true);
    else
      return Future.value(false);
  }

  @override
  Future<bool> signup(user, password) {
    if (user == 'a@a.com')
      return Future.value(true);
    else
      return Future.value(false);
  }
}

class MockAuthentication extends Mock implements Authentication {
  @override
  Future<bool> get init async {
    logInfo('MockAuthentication init');
    return Future.value(true);
  }
}

void main() {
  setUp(() {
    final MockAuthentication _mockAuthentication = MockAuthentication();
    Get.put<Authentication>(_mockAuthentication);
    final controller = MockAuthenticationController();
    Get.put<AuthenticationController>(controller);
  });
  testWidgets('Login ok widget testing', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(const Key('loginScaffold')), findsOneWidget);

    expect(find.byKey(const Key('loginEmail')), findsNWidgets(1));

    await tester.enterText(find.byKey(const Key('loginEmail')), 'a@a.com');

    await tester.enterText(find.byKey(const Key('loginPassord')), '123456');

    await tester.tap(find.byKey(const Key('loginSubmit')));

    await tester.pump();

    expect(find.text('User ok'), findsOneWidget);
  });

  testWidgets('Login nok widget testing', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(const Key('loginScaffold')), findsOneWidget);

    expect(find.byKey(const Key('loginEmail')), findsNWidgets(1));

    await tester.enterText(find.byKey(const Key('loginEmail')), 'b@a.com');

    await tester.enterText(find.byKey(const Key('loginPassord')), '123456');

    await tester.tap(find.byKey(const Key('loginSubmit')));

    await tester.pump();

    expect(find.text('User problem'), findsOneWidget);
  });

  testWidgets('SignUp ok widget testing', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const GetMaterialApp(
        home: SignUpPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(const Key('signUpScaffold')), findsOneWidget);

    await tester.enterText(find.byKey(const Key('signUpEmail')), 'a@a.com');

    await tester.enterText(find.byKey(const Key('signUpPassord')), '123456');

    await tester.tap(find.byKey(const Key('signUpSubmit')));

    await tester.pump();

    expect(find.text('User ok'), findsOneWidget);
  });

  testWidgets('SignUp nok widget testing', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const GetMaterialApp(
        home: SignUpPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(const Key('signUpScaffold')), findsOneWidget);

    await tester.enterText(find.byKey(const Key('signUpEmail')), 'b@a.com');

    await tester.enterText(find.byKey(const Key('signUpPassord')), '123456');

    await tester.tap(find.byKey(const Key('signUpSubmit')));

    await tester.pump();

    expect(find.text('User problem'), findsOneWidget);
  });

  testWidgets('SignUp with missing @ widget testing',
      (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const GetMaterialApp(
        home: SignUpPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(const Key('signUpScaffold')), findsOneWidget);

    await tester.enterText(find.byKey(const Key('signUpEmail')), 'a');

    await tester.enterText(find.byKey(const Key('signUpPassord')), '123456');

    await tester.tap(find.byKey(const Key('signUpSubmit')));

    await tester.pump();

    expect(find.text('Validation nok'), findsOneWidget);
  });
}
