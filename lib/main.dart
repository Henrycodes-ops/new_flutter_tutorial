import 'package:flutter/material.dart';
import 'package:swipe_deck/swipe_deck.dart';

const Images = ["image1.png", "image2.png", "image3.png"];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Learning',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Learning'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SwipeDeck(
        aspectRatio: 1,
        startIndex: 0,
        // emptyIndicator: Center(child: CircularProgressIndicator(),),
        widgets: Images.map((e)
         => Image.asset(
          "assets/images/$e",
          fit: BoxFit.cover,
          )
          ).toList(),
      ),
    );
  }
}
