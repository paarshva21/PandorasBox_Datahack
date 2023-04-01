import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:datahack/Auth/GoogleClassSignIn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:datahack/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Models/Utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
    child: AdaptiveTheme(
      light: ThemeData(brightness: Brightness.light),
      dark: ThemeData(brightness: Brightness.dark),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        theme: theme,
        darkTheme: darkTheme,
        scaffoldMessengerKey: messengerKey,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ),
  ));
}
