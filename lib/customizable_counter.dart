library customizable_counter;

import 'package:flutter/material.dart';

class CustomizableCounter extends StatefulWidget {
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final Color? backgroundColor;
  final String? buttonText;
  final Color? textColor;
  final double? textSize;
  final Widget? decrementIcon;
  final Widget? incrementIcon;
  final double count;
  final double maxCount;
  final double minCount;
  final double step;
  final bool showButtonText;
  final void Function(double c)? onCountChange;

  const CustomizableCounter({
    Key? key,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.backgroundColor,
    this.buttonText,
    this.textColor,
    this.textSize,
    this.decrementIcon,
    this.incrementIcon,
    this.count = 0,
    this.maxCount = double.maxFinite,
    this.minCount = 0,
    this.step = 1,
    this.showButtonText = true,
    this.onCountChange,
  }) : super(key: key);

  @override
  State<CustomizableCounter> createState() => _CustomizableCounterState();
}

class _CustomizableCounterState extends State<CustomizableCounter> {
  double mCount = 0;

  @override
  void initState() {
    mCount = widget.count;
    super.initState();
  }

  void decrement() {
    setState(() {
      if ((mCount - widget.step) >= widget.minCount) {
        mCount -= widget.step;
        widget.onCountChange?.call(mCount);
      }
    });
  }

  void increment() {
    setState(() {
      if ((mCount + widget.step) <= widget.maxCount) {
        mCount += widget.step;
        widget.onCountChange?.call(mCount);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            shape: BoxShape.rectangle,
            border: Border.all(
                color: widget.borderColor ?? Theme.of(context).primaryColor,
                width: widget.borderWidth ?? 2.0),
          ),
          child: (mCount == 0) && widget.showButtonText
              ? MaterialButton(
                  onPressed: () {
                    increment();
                  },
                  child: Text(
                    widget.buttonText ?? "Add",
                    style: TextStyle(
                      color: widget.textColor,
                      fontSize: widget.textSize,
                    ),
                  ))
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: decrement,
                        icon: widget.decrementIcon ??
                            Icon(
                              Icons.remove,
                              color: widget.textColor,
                            )),
                    Text(
                      _formatDouble(mCount),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: widget.textSize,
                      ),
                    ),
                    IconButton(
                        onPressed: increment,
                        icon: widget.incrementIcon ??
                            Icon(
                              Icons.add,
                              color: widget.textColor,
                            )),
                  ],
                ),
        )
      ],
    );
  }
}

String _formatDouble(double value) {
  //this also rounds (so 0.8999999999999999 becomes '0.9000')
  var verbose = value.toStringAsFixed(4);
  var trimmed = verbose;
  //trim all trailing 0's after the decimal point (and the decimal point if applicable)
  for (var i = verbose.length - 1; i > 0; i--) {
    if (trimmed[i] != '0' && trimmed[i] != '.' || !trimmed.contains('.')) {
      break;
    }
    trimmed = trimmed.substring(0, i);
  }
  return trimmed;
}
