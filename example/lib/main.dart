import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customizable Counter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Customizable Counter Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CustomizableCounter(
          borderColor: const Color(0xFFE64A19),
          borderWidth: 1.5,
          borderRadius: 12,
          backgroundColor: const Color(0xFFFFCCBC),
          buttonText: "Add To Cart",
          textColor: const Color(0xFFE64A19),
          textSize: 18,
          count: 0,
          maxCount: 10,
          incrementIcon: const Icon(
            Icons.text_increase,
            color: Colors.yellowAccent,
          ),
          decrementIcon: const Icon(
            Icons.text_decrease,
            color: Colors.yellowAccent,
          ),
          onCountChange: (count) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Value Changed: $count"),
                duration: const Duration(milliseconds: 250),
              ),
            );
          },
        ),
      ),
    );
  }
}
