import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_flutter_tutorial/calculator.dart';
import 'package:new_flutter_tutorial/two_digit_operation.dart';
import 'package:new_flutter_tutorial/operation.dart';
import 'package:mockito/mockito.dart';


class MockCalculator extends Mock implements Calculator {

}




void main() {
  late Calculator calculator;

  setUp(() {
    calculator = MockCalculator();
  });

  group('TwoDigitOperation', () {
    group('Operation.divide', () {
      testWidgets('prints the value returned by the calculator', (tester) async {
        when(calculator.divide(3, 1)).thenThrow(Exception('oops'));
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
        expect(find.text('is ???'), findsOneWidget);
      });
    });
  });
}
