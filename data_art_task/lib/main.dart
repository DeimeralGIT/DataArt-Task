import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'routes/app_router.dart';
import 'store/store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'GB'),
      ],
      startLocale: const Locale('en', 'GB'),
      fallbackLocale: const Locale('en', 'GB'),
      path: 'assets/translations',
      child: StoreProvider<AppState>(
        store: store,
        child: MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final Future<FirebaseApp> _firebaseInit = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Wait for Firebase initialization to complete
      future: _firebaseInit,
      builder: (context, snapshot) => MaterialApp.router(
        title: 'DataArt Task',
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        routerConfig: router.config(),
      ),
    );
  }
}
