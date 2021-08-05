import 'dart:async';

import 'package:calculator/store/controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runZonedGuarded(() {
    runApp(
      MultiProvider(
        providers: [
          Provider<Controller>(create: (_) => Controller()),
        ],
        child: MyApp(),
      ),
    );
  }, FirebaseCrashlytics.instance.recordError);
}
