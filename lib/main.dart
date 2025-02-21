import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/Add_Event.dart';
import 'package:evently_app/Home_Screen1.dart';
import 'package:evently_app/auth/Login_Screen/login_screen.dart';
import 'package:evently_app/firebase_options.dart';
import 'package:evently_app/providers/app_Theme_providers.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/eventListProvider.dart';
import 'package:evently_app/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'auth/Register_Screen/Registe_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
    ChangeNotifierProvider(create: (context) => AppThemeProviders()),
    ChangeNotifierProvider(create: (context) => EventListProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProviders>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen1.routeName: (context) => HomeScreen1(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisteScreen.routeName: (context) => RegisteScreen(),
        AddEvent.routeName: (context) => AddEvent(),
      },
    );
  }
}
