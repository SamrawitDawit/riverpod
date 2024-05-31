import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newcompiled/presentation/screens2/login_screen.dart';


void main() {
  testWidgets('LoginPage has email, password fields and login button', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: LoginPage(),
        ),
      ),
    );

    // Check if email and password input fields are present
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Enter text into input fields
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password');

    // Tap the login button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify some expected outcome
  });
}
