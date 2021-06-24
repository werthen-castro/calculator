import 'package:flutter/material.dart';

import 'button_widget.dart';

class CollumnSimbolsWidget extends StatelessWidget {
  final List<String> labels;
  final double fontSize;
  CollumnSimbolsWidget({required this.labels, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<ButtonWidget>.generate(
            labels.length,
            (index) => ButtonWidget(
                  value: labels[index],
                  fontSize: fontSize,
                )),
      ),
    );
  }
}
