import 'package:flutter_test/flutter_test.dart';
import 'package:new_flutter_tutorial/calculator.dart';

void main() {
  // setUpAll(() => print('Runs Before any test is executed'));

  // setUp(() => print('Runs BEFORE EVERY test is executed'));

  // tearDown(() => print('Runs AFTER EVERY test is executed'));

  // tearDownAll(() => print('Runs AFTER all tests are executed'));

  late Calculator calculator;

  setUp(() {
    calculator = Calculator();
  });

  group('add tests', () {
    test('the calculator returns 4 when adding 2 and 2', () {
      expect(calculator.add(2, 2), 4);
    });
  });

  group('multiplying', () {
    test('the calculator returns 0 when multiplying 4 by 0', () {
      // third step
      expect(calculator.multiply(4, 0), 0);
    });
  });

  group('subtracting', () {
    test('the calculator returns 0 when subtracting 4 from 4', (){
      //  setup

      // second step: execute

      // third step
      expect(calculator.subtract(4, 4), 0);
    });
  });

  group('divide tests', () {
    test('the calculator throws an ArgumentError when dividing by zero', () {
     
      expect(calculator.divide(4, 0), throwsArgumentError);
    });
  });
}
