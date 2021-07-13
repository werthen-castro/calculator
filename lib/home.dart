import 'package:calculator/widgets/button_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/theme_model.dart';
import 'widgets/collumn_simbols_widget.dart';

class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  static const List<String> collumnFour = ['←', '÷', '×', '-', '+', '='];
  static const List<String> collumnThree = ['%', 'log', '9', '6', '3', ','];
  static const List<String> collumnTwo = ['CE', 'n!', '8', '5', '2', '0'];
  static const List<String> collumnOne = ['C', 'x²', '7', '4', '1', '±'];

  final resultController = TextEditingController(text: '10 + 20');
  final operationController = TextEditingController(text: '30000');

  double gridHeight = 0;

  @override
  void didChangeDependencies() {
    context.read<ThemeModel>().initMode();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.read<ThemeModel>().mode == ThemeMode.light
          ? Colors.white
          : Colors.black,
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 140,
                ),
                ButtonModeWidget(),
              ],
            ),
          ),
          Container(
            height: 171,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      operationController.text,
                      style: TextStyle(
                          fontSize: 100,
                          color: context.read<ThemeModel>().contrasteColor),
                    ),
                    Text(
                      operationController.text,
                      style: TextStyle(
                          fontSize: 40,
                          color: context.read<ThemeModel>().contrasteColor),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Container(
              color: context.read<ThemeModel>().mode == ThemeMode.light
                  ? Colors.white
                  : Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CollumnSimbolsWidget(
                    labels: collumnOne,
                    fontSize: 35,
                  ),
                  CollumnSimbolsWidget(
                    labels: collumnTwo,
                    fontSize: 35,
                  ),
                  CollumnSimbolsWidget(
                    labels: collumnThree,
                    fontSize: 35,
                  ),
                  CollumnSimbolsWidget(
                    collumFinal: true,
                    labels: collumnFour,
                    fontSize: 45,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
