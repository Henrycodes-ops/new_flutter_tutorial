import 'package:new_flutter_tutorial/calculator.dart';

enum Operation { add, subtract, multiply, divide }

extension OperationExtension on Operation {
  double apply(Calculator calculator, double a, double b) {
    switch (this) {
      case Operation.add:
        return calculator.add(a, b);
      case Operation.subtract:
        return calculator.subtract(a, b);
      case Operation.multiply:
        return calculator.multiply(a, b);
      case Operation.divide:
        return calculator.divide(a, b);
    }
  }

  String get operationName {
    switch (this) {
      case Operation.add:
        return 'plus';
      case Operation.subtract:
        return 'minus';
      case Operation.multiply:
        return 'times';
      case Operation.divide:
        return 'divide';
    }
  }

  String get label {
    switch (this) {
      case Operation.add:
        return 'Add';
      case Operation.subtract:
        return 'Subtract';
      case Operation.multiply:
        return 'Multiply';
      case Operation.divide:
        return 'Divide';
    }
  }
}
