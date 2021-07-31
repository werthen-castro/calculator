import 'package:flutter/material.dart';

import 'button_widget.dart';

class CollumnSimbolsWidget extends StatelessWidget {
  final List<String> labels;
  final double fontSize;
  final bool collumFinal;
  CollumnSimbolsWidget({
    required this.labels,
    this.collumFinal = false,
    required this.fontSize,
  });

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
            collumFinal: collumFinal,
          ),
        ),
      ),
    );
  }
}
