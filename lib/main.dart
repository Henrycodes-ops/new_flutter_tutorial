// import 'package:flutter/material.dart';
// import 'package:swipe_deck/swipe_deck.dart';

// const Images = ["image1.png", "image2.png", "image3.png"];

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Learning',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Learning'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.title)),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SizedBox.expand(
//             child: Center(
//               child: Container(
//                 width: constraints.maxWidth * 0.8,
//                 height: constraints.maxHeight * 0.8,
//                 color: Colors.grey.shade300,
//                 child: SwipeDeck(
//                   aspectRatio: 3 / 4,
//                   startIndex: 0,
//                   // allowRightSwipe: false,
//                   // allowLeftSwipe: false,
//                   widgets: Images.map(
//                     (e) => ClipRRect(
//                       borderRadius: BorderRadius.circular(12),
//                       child: SizedBox.expand(
//                         child: Image.asset(
//                           "assets/images/$e",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ).toList(),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:new_flutter_tutorial/calculator.dart';
import 'package:new_flutter_tutorial/two_digit_operation.dart';
void main() {
  runApp( CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculator = Calculator();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Calculator App')),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(children: [
            TwoDigitOperation(
              calculator: calculator,
              operation: calculator.add,
            ),
            Divider(),
            TwoDigitOperation(
              calculator: calculator,
              operation: calculator.subtract,
            ),
            Divider(),
            TwoDigitOperation(
              calculator: calculator,
              operation: calculator.multiply,
            ),
            Divider(),
            TwoDigitOperation(
              calculator: calculator,
              operation: calculator.divide,
            ),
            Divider(),
          ],),
          ),
        ),
      ),
    );
  }
}
