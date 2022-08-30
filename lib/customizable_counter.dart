library customizable_counter;

import 'package:flutter/material.dart';

class CustomizableCounter extends StatefulWidget {
  const CustomizableCounter({Key? key}) : super(key: key);

  @override
  State<CustomizableCounter> createState() => _CustomizableCounterState();
}

class _CustomizableCounterState extends State<CustomizableCounter> {
  int counter = 0;

  void decrement() {
    setState(() {
      if (counter == 1) {
        counter = 0;
      } else {
        counter--;
      }
    });
  }

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black, width: 2)),
          child: counter == 0
              ? MaterialButton(
                  onPressed: () {
                    increment();
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ))
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: decrement,
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.black,
                        )),
                    Text(
                      counter.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    IconButton(
                        onPressed: increment,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        )),
                  ],
                ),
        )
      ],
    );
  }
}
