import 'package:flutter_test/flutter_test.dart';
import 'package:new_flutter_tutorial/main.dart';
import 'package:new_flutter_tutorial/two_digit_operation.dart';

void main() {
  group('Calculator app', () {
    testWidgets('renders four widgets of type TwoDigitOperation', (WidgetTester tester) async {
      await tester.pumpWidget(CalculatorApp());
      expect(find.byType(TwoDigitOperation), findsNWidgets(4));
    });
  });
}