import 'package:calculator/store/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Controller>(create: (_) => Controller()),
      ],
      child: MyApp(),
    ),
  );
}
