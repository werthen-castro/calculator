import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'package:provider/provider.dart';
import 'home.dart';
import 'models/theme_model.dart';

class MyApp extends StatefulWidget {
  MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModel>(
        create: (_) => ThemeModel(),
        child: Consumer<ThemeModel>(builder: (_, model, __) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: model.mode,
            home: LocalizationWidget(
              child: Home(),
            ),
          );
        }));
  }
}
