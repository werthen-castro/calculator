import 'package:calculator/widgets/collumn_simbols_widget.dart';
import 'package:flutter/material.dart';

class StandartTab extends StatefulWidget {
  final double gridHeight;
  StandartTab(this.gridHeight);

  @override
  _StandartTabState createState() => _StandartTabState();
}

class _StandartTabState extends State<StandartTab> {
  static const List<String> collumnFour = ['←', '÷', '×', '-', '+', '='];
  static const List<String> collumnThree = ['%', 'log', '9', '6', '3', ','];
  static const List<String> collumnTwo = ['CE', 'n!', '8', '5', '2', '0'];
  static const List<String> collumnOne = ['C', 'x²', '7', '4', '1', '±'];
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
                labels: collumnOne,
                fontSize: 27,
              ),
              CollumnSimbolsWidget(
                labels: collumnTwo,
                fontSize: 27,
              ),
              CollumnSimbolsWidget(
                labels: collumnThree,
                fontSize: 27,
              ),
              CollumnSimbolsWidget(
                labels: collumnFour,
                fontSize: 38,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
