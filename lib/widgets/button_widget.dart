import 'package:calculator/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  final String value;
  final double fontSize;

  ButtonWidget({required this.value, this.fontSize = 45});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          color: value != '=' ? Colors.transparent : Colors.red,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                value,
                style: TextStyle(
                    fontSize: fontSize,
                    color: value != '='
                        ? context.read<ThemeModel>().contrasteColor
                        : Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
