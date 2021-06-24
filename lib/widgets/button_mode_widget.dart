import 'package:calculator/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonModeWidget extends StatefulWidget {
  ButtonModeWidget();

  @override
  _ButtonModeWidgetState createState() => _ButtonModeWidgetState();
}

class _ButtonModeWidgetState extends State<ButtonModeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          context.read<ThemeModel>().toggleMode();
        },
        child: Container(
          color: Colors.transparent,
          height: 20,
          width: 80,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.change_circle_outlined,
                  color: context.read<ThemeModel>().mode == ThemeMode.light
                      ? Colors.black
                      : Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                  ),
                  child: Text(
                    context.read<ThemeModel>().mode == ThemeMode.light
                        ? 'Dark'
                        : 'Ligth',
                    style: TextStyle(
                        color:
                            context.read<ThemeModel>().mode == ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
