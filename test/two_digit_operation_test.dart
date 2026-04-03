import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_flutter_tutorial/calculator.dart';
import 'package:new_flutter_tutorial/two_digit_operation.dart';
import 'package:new_flutter_tutorial/operation.dart';

void main() {
  late Calculator calculator;

  setUp(() {
    calculator = Calculator();
  });

  group('TwoDigitOperation', () {
    group('Operation.add', () {
      testWidgets('prints 4.0 when adding 3 and 1', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: TwoDigitOperation(
                calculator: calculator,
                operation: Operation.add,
              ),
            ),
          ),
        );
        await tester.enterText(
          find.byKey(const Key('textField_top_plus')),
          '3',
        );
        await tester.enterText(
          find.byKey(const Key('textField_bottom_plus')),
          '1',
        );
        await tester.pumpAndSettle();
        await tester.tap(find.byType(ElevatedButton));
        await tester.pumpAndSettle();
        expect(find.text('Result: 4.0'), findsOneWidget);
      });
    });
  });
}
