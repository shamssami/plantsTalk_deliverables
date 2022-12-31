import 'package:plants_talk/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plants_talk/Views/Pages/registeration/login_screen.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return new MediaQuery(
        data: new MediaQueryData(), child: new MaterialApp(home: widget));
  }

  group('Test Login', (() {
    testWidgets('PlantsTalk Test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(buildTestableWidget(MyApp()));

      var email = find.byKey(const Key('email'));
      // var e_placeholder = find.byKey(Key('emailholder'));
      var password = find.byKey(Key('pass'));
      // var passholder = find.byKey(Key('passholder'));

      var loginButton = find.byKey(Key('login'));
      var logintext = find.byKey(Key('logintext'));

      expect(email, findsOneWidget);
      expect(password, findsOneWidget);
      expect(loginButton, findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.tap(loginButton);

      await tester.pumpAndSettle(const Duration(seconds: 4));
      await tester.pump();
    });
  }));
}
