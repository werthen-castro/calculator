import 'package:calculator/widgets/collumn_simbols_widget.dart';
import 'package:flutter/material.dart';

class ScientificTab extends StatefulWidget {
  final double gridHeight;
  ScientificTab(this.gridHeight);

  @override
  _ScientificTabState createState() => _ScientificTabState();
}

class _ScientificTabState extends State<ScientificTab> {
  static const List<String> collumnFour = ['←', '√', '÷', '×', '-', '+', '='];
  static const List<String> collumnThree = [
    '%',
    'ln',
    'log',
    '9',
    '6',
    '3',
    ','
  ];
  static const List<String> collumnTwo = ['CE', 'n!', ')', '8', '5', '2', '0'];
  static const List<String> collumnOne = ['C', 'x²', '(', '7', '4', '1', '±'];
  static const List<String> collumnZero = [
    'mod',
    '|×|',
    'e',
    'π',
    'cos',
    'sen',
    'tan'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('45x8+2', style: TextStyle(fontSize: 30)),
                      Text('180', style: TextStyle(fontSize: 120)),
                    ],
                  ),
                ),
              );
            }),
        Container(
          height: widget.gridHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CollumnSimbolsWidget(
                labels: collumnZero,
                fontSize: 25,
              ),
              CollumnSimbolsWidget(
                labels: collumnOne,
                fontSize: 25,
              ),
              CollumnSimbolsWidget(
                labels: collumnTwo,
                fontSize: 25,
              ),
              CollumnSimbolsWidget(
                labels: collumnThree,
                fontSize: 25,
              ),
              CollumnSimbolsWidget(
                labels: collumnFour,
                fontSize: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
