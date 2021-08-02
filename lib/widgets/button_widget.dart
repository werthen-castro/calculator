import 'package:calculator/models/theme_model.dart';
import 'package:calculator/store/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  final String value;
  final double fontSize;
  final bool collumFinal;

  ButtonWidget({
    required this.value,
    this.fontSize = 55,
    this.collumFinal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<Controller>().teclar(value);
        },
        child: Container(
          color: value != '=' ? Colors.transparent : Colors.red,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: 6,
                right: 5,
              ),
              child: Text(
                value,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: fontSize,
                  color: value != '='
                      ? collumFinal
                          ? Colors.red
                          : context.read<ThemeModel>().contrasteColor
                      : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
