import 'package:flutter/material.dart';
import 'package:new_flutter_tutorial/calculator.dart';

import 'package:new_flutter_tutorial/operation.dart';

class TwoDigitOperation extends StatefulWidget {
  final Calculator calculator;
  final Operation operation;

  const TwoDigitOperation({
    super.key,
    required this.calculator,
    required this.operation,
  });

  @override
  State<TwoDigitOperation> createState() => _TwoDigitOperationState();
}

class _TwoDigitOperationState extends State<TwoDigitOperation> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  String resultText = '';

  void compute() {
    final first = double.tryParse(firstController.text);
    final second = double.tryParse(secondController.text);

    if (first == null || second == null) {
      setState(() {
        resultText = 'Enter valid numbers';
      });
      return;
    }

    try {
      final result = widget.operation.apply(widget.calculator, first, second);
      setState(() {
        resultText = 'Result: $result';
      });
    } catch (error) {
      setState(() {
        resultText = error.toString();
      });
    }
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.operation.label, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    key: Key('textField_top_${widget.operation.operationName}'),
                    controller: firstController,
                    decoration: const InputDecoration(labelText: 'First number'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    key: Key('textField_bottom_${widget.operation.operationName}'),
                    controller: secondController,
                    decoration: const InputDecoration(labelText: 'Second number'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(onPressed: compute, child: Text(widget.operation.label)),
                const SizedBox(width: 12),
                Text(resultText),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
