import 'package:calculator/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
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
          width: 100,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                context.read<ThemeModel>().mode == ThemeMode.light
                    ? Icon(Entypo.moon, color: Colors.black)
                    : Icon(
                        Iconic.sun,
                        color: Colors.white,
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
