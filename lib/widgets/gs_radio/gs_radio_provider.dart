import 'package:flutter/material.dart';
import 'package:gluestack_flutter_pro/style/gs_style.dart';

class GSRadioProvider<T> extends InheritedWidget {
  final GSSizes size;
  final T value;
  final T groupValue;

  const GSRadioProvider({
    super.key,
    required this.size,
    required this.groupValue,
    required this.value,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(GSRadioProvider oldWidget) {
    return size != oldWidget.size||groupValue!=oldWidget.groupValue;
  }

  static GSRadioProvider<T>? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GSRadioProvider<T>>();
  }
}
