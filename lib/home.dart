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
  final operationController = TextEditingController(text: '300000000');

  late TabController _tabController;
  double gridHeight = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<ThemeModel>().initMode();

    gridHeight = MediaQuery.of(context).size.height -
        370 -
        MediaQuery.of(context).padding.top;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            actions: <Widget>[ButtonModeWidget()],
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
          )),
      body: Column(
        children: [
          Container(
            // color: Colors.yellow,
            height: 260,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    textAlign: TextAlign.end,
                    enabled: false,
                    controller: resultController,
                    style: TextStyle(fontSize: 50),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                  TextField(
                    textAlign: TextAlign.end,
                    onChanged: (value) {},
                    controller: operationController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 0),
                    ),
                    style: TextStyle(
                      fontSize: 120,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: gridHeight,
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
        ],
      ),
    );
  }

  iconMode() {
    return GestureDetector(
        onTap: () {
          context.read<ThemeModel>().toggleMode();
        },
        child: Container(
          color: Colors.transparent,
          // height: 20,
          // width: 80,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 18,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Icons.change_circle_outlined,
                  size: 30,
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
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
