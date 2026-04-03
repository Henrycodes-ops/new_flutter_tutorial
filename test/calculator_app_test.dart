import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_flutter_tutorial/main.dart';
import 'package:new_flutter_tutorial/two_digit_operation.dart';

void main() {
  group('Calculator app', () {
    testWidgets('renders four widgets of type TwoDigitOperation', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(CalculatorApp());
      expect(find.byType(TwoDigitOperation), findsNWidgets(4));
    });
  });

  group('add', () {
    testWidgets('shows result when given two numbers', (tester) async {
      await tester.pumpWidget(CalculatorApp());
      final topTextFieldFinder = find.byKey(Key('textField_top_plus'));
      final bottomTextFieldFinder = find.byKey(Key('textField_bottom_plus'));

      await tester.ensureVisible(topTextFieldFinder);
      await tester.tap(topTextFieldFinder);
      await tester.enterText(topTextFieldFinder, '3');
      
      await tester.ensureVisible(bottomTextFieldFinder);
      await tester.tap(bottomTextFieldFinder);
      await tester.enterText(bottomTextFieldFinder, '6');

      // Trigger compute by pressing the first compute button (plus operation) and rebuild.
      await tester.tap(find.byType(ElevatedButton).first);
      await tester.pumpAndSettle();

      expect(find.text('Result: 9.0'), findsOneWidget);
    });
  });
}
