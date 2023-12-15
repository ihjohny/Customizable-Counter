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
      debugShowCheckedModeBanner: false,
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
          borderColor: Colors.yellow,
          borderWidth: 5,
          borderRadius: 100,
          backgroundColor: Colors.amberAccent,
          buttonText: "Add Item",
          textColor: Colors.white,
          textSize: 22,
          count: 0,
          step: 1,
          minCount: 0,
          maxCount: 10,
          suffix: "%",
          incrementIcon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          decrementIcon: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
          onDecrement: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Value Decremented: $value"),
                duration: const Duration(milliseconds: 250),
              ),
            );
          },
          onIncrement: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Value Incremented: $value"),
                duration: const Duration(milliseconds: 250),
              ),
            );
          },
          onCountChange: (value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Value Changed: $value"),
                duration: const Duration(milliseconds: 250),
              ),
            );
          },
        ),
      ),
    );
  }
}
