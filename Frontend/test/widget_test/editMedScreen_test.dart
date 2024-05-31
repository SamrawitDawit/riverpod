import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:newcompiled/presentation/screens2/edit_medicine_screen.dart';


void main() {
  testWidgets('EditMedicineScreen has input fields, edit, and delete buttons', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: EditMedicineScreen(user_id: 'test_user_id'),
        ),
      ),
    );

    // Check if all input fields are present
    expect(find.byType(TextFormField), findsNWidgets(4));
    expect(find.byType(ElevatedButton), findsNWidgets(2));

    // Enter text into input fields
    await tester.enterText(find.byType(TextFormField).at(0), 'Edited Medicine Name');
    await tester.enterText(find.byType(TextFormField).at(1), 'Edited Description');
    await tester.enterText(find.byType(TextFormField).at(2), '150');
    await tester.enterText(find.byType(TextFormField).at(3), 'Edited Type');

    // Tap the edit medicine button
    await tester.tap(find.byType(ElevatedButton).at(0));
    await tester.pump();

    // Tap the delete medicine button
    await tester.tap(find.byType(ElevatedButton).at(1));
    await tester.pump();

    // Verify some expected outcome
  });
}
