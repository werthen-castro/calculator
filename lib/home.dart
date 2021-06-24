import 'package:calculator/tabs/scientific.dart';
import 'package:calculator/widgets/button_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/theme_model.dart';
import 'tabs/standard_tab.dart';

class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
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
        250 -
        110 -
        MediaQuery.of(context).padding.top;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: AppBar(
          elevation: 0,
          actions: <Widget>[ButtonModeWidget()],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          bottom: TabBar(
            labelColor: context.read<ThemeModel>().mode == ThemeMode.light
                ? Colors.black
                : Colors.white,
            controller: _tabController,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3.5,
            tabs: [
              Tab(
                  icon: Text(
                'Standard',
                style: TextStyle(fontSize: 20),
              )),
              Tab(icon: Text('Scientific', style: TextStyle(fontSize: 20))),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(child: StandartTab(gridHeight)),
          Container(child: ScientificTab(gridHeight)),
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
