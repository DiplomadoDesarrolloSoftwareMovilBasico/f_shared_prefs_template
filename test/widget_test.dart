import 'package:f_shared_prefs_template/domain/use_case/authentication.dart';
import 'package:f_shared_prefs_template/ui/controllers/authentication_controller.dart';
import 'package:f_shared_prefs_template/ui/pages/authentication/login_page.dart';
import 'package:f_shared_prefs_template/ui/pages/authentication/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
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
    print('MockAuthentication init');
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
      MaterialApp(
        home: LoginPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(Key('loginScaffold')), findsOneWidget);

    expect(find.byKey(Key('loginEmail')), findsNWidgets(1));

    await tester.enterText(find.byKey(Key('loginEmail')), 'a@a.com');

    await tester.enterText(find.byKey(Key('loginPassord')), '123456');

    await tester.tap(find.byKey(Key('loginSubmit')));

    await tester.pump();

    expect(find.text('User ok'), findsOneWidget);
  });

  testWidgets('Login nok widget testing', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(Key('loginScaffold')), findsOneWidget);

    expect(find.byKey(Key('loginEmail')), findsNWidgets(1));

    await tester.enterText(find.byKey(Key('loginEmail')), 'b@a.com');

    await tester.enterText(find.byKey(Key('loginPassord')), '123456');

    await tester.tap(find.byKey(Key('loginSubmit')));

    await tester.pump();

    expect(find.text('User problem'), findsOneWidget);
  });

  testWidgets('SignUp ok widget testing', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      GetMaterialApp(
        home: SignUpPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(Key('signUpScaffold')), findsOneWidget);

    await tester.enterText(find.byKey(Key('signUpEmail')), 'a@a.com');

    await tester.enterText(find.byKey(Key('signUpPassord')), '123456');

    await tester.tap(find.byKey(Key('signUpSubmit')));

    await tester.pump();

    expect(find.text('User ok'), findsOneWidget);
  });

  testWidgets('SignUp nok widget testing', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      GetMaterialApp(
        home: SignUpPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(Key('signUpScaffold')), findsOneWidget);

    await tester.enterText(find.byKey(Key('signUpEmail')), 'b@a.com');

    await tester.enterText(find.byKey(Key('signUpPassord')), '123456');

    await tester.tap(find.byKey(Key('signUpSubmit')));

    await tester.pump();

    expect(find.text('User problem'), findsOneWidget);
  });

  testWidgets('SignUp with missing @ widget testing',
      (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      GetMaterialApp(
        home: SignUpPage(),
      ),
    );
    await tester.pump();

    expect(find.byKey(Key('signUpScaffold')), findsOneWidget);

    await tester.enterText(find.byKey(Key('signUpEmail')), 'a');

    await tester.enterText(find.byKey(Key('signUpPassord')), '123456');

    await tester.tap(find.byKey(Key('signUpSubmit')));

    await tester.pump();

    expect(find.text('Validation nok'), findsOneWidget);
  });
}
