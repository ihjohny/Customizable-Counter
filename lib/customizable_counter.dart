library customizable_counter;

import 'package:flutter/material.dart';

/// A counter widget that support different kinds of customization.
class CustomizableCounter extends StatefulWidget {
  /// color of widget border
  final Color? borderColor;

  /// width of widget border
  final double? borderWidth;

  /// radius of widget border
  final double? borderRadius;

  /// color of widget background
  final Color? backgroundColor;

  /// text that will shown on widget if counter value is zero.
  final String? buttonText;

  /// button title and counter text color
  final Color? textColor;

  /// button title and counter text size
  final double? textSize;

  /// icon widget that will be shown on left side and by clicking this widget
  /// the counter value will de decreased.
  final Widget? decrementIcon;

  /// icon widget that will be shown on right side and by clicking this widget
  /// the counter value will de increased.
  final Widget? incrementIcon;

  /// the current value of the counter.
  final double count;

  /// the maximum value support for counter
  final double maxCount;

  /// the minimum value support for counter
  final double minCount;

  /// amount increased or decreased after clicking buttons.
  final double step;

  /// does shown button text when counter value is zero.
  final bool showButtonText;

  /// called when the counter value change by clicking button.
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
          child: ((mCount <= widget.minCount) && widget.showButtonText)
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
